/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package recsgenerator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.json.*;

/**
 *
 * @author Henrique
 */
public class RecsGenerator {

    /**
     * @param args the command line arguments
     */
    static ArrayList<Integer> usersArr = new ArrayList<Integer>();
    static String general = "general.txt";
    //TROCAR NOMBES DOS CLUSTERS
    static String[] clusters = {"k6-cluster5670.txt","k6-cluster5673.txt", "k6-cluster5677.txt", "k6-cluster5680.txt", "k6-cluster5684.txt", "k6-cluster5685.txt" };
    
    
    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, TasteException {
        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
        Document doc = docBuilder.parse(new File("config//config.xml"));
        doc.getDocumentElement().normalize();
        NodeList listConfig = doc.getElementsByTagName("usersList");
        Node usersListNode = listConfig.item(0);
        Element usersListElement = (Element)usersListNode;
        NodeList userIDList = usersListElement.getElementsByTagName("userID");
        for(int j=0; j<userIDList.getLength(); j++){
            Element idElement = (Element)userIDList.item(j);
            NodeList auxList = idElement.getChildNodes();
            String uid = ((Node)auxList.item(0)).getNodeValue().trim();
            usersArr.add( Integer.parseInt(uid));
        }
        
        DBConnection con = new DBConnection( "rosario","root", "1234");
        FileWriter fw = new FileWriter(new File("recommendations.json"));
        /* Objeto JSON de resposta */
        JSONArray result = new JSONArray();
        /*
            Define que as mensagens de logs sejam do nível de erro 
            evitando assim, mensagens de notificação
        */
        System.setProperty("org.slf4j.simpleLogger.defaultLogLevel", "error");
        /*
            Em caso de logs de erros, estes devem ser escritos em um arquivo
        */
        System.setProperty("org.slf4j.simpleLogger.logFile", "MerlotRecommender.log");
        
        /* Construção de um recomendador */
        RecommenderBuilder builder = new RecommenderBuilder() {
            @Override
            public Recommender buildRecommender(DataModel dm) throws TasteException {
                UserSimilarity sim = new EuclideanDistanceSimilarity(dm);
                //UserSimilarity sim = new PearsonCorrelationSimilarity(dm);
                //UserSimilarity sim = new LogLikelihoodSimilarity(dm);
                UserNeighborhood neighborhood = new NearestNUserNeighborhood(10, sim, dm);        
                return new GenericUserBasedRecommender(dm, neighborhood, sim);
            }
    	};
        
        for(int iduser : usersArr){
            
            //Recomendação geral
            FileDataModel modelGeneral = new FileDataModel(new File(general));
            List<RecommendedItem> listGeneral = builder.buildRecommender(modelGeneral).recommend(iduser, 2);
            ArrayList<Integer> ids_rec_general = new ArrayList<Integer>(listGeneral.size());
            for(int a1=0; a1<listGeneral.size();a1++){
                ids_rec_general.add(a1, con.addRec(iduser, (int) (long)listGeneral.get(a1).getItemID(), Math.round(listGeneral.get(a1).getValue()), "general"));
            }
          
            //printList(iduser, listGeneral);
            
            
            
            //Recomendação em cada cluster
            
            ArrayList<RecommendedItem> listClustersFinal = new ArrayList<RecommendedItem>();
            for(int k=1; k<7; k++){
                FileDataModel modelCluster = new FileDataModel(new File(clusters[k-1]));
                List<RecommendedItem> listClusters = builder.buildRecommender(modelCluster).recommend(iduser, 2);
                if(!listClusters.isEmpty()){
                    listClustersFinal.addAll(listClusters);
                }
            }
            Collections.sort(listClustersFinal, new Comparator<RecommendedItem>() {
                @Override
                public int compare(RecommendedItem  item1, RecommendedItem  item2)
                {
                    if(item1.getValue() > item2.getValue()){
                        return  1;
                    }
                    else if(item1.getValue() == item2.getValue()){
                        return  0;
                    }
                    else{
                        return -1;
                    }
                }
            });
            Collections.reverse(listClustersFinal);
            //printList(iduser, listClustersFinal);
            JSONArray objectsG = new JSONArray();
            int a2=0;
            for(RecommendedItem rec : listGeneral){
                JSONObject object = new JSONObject();
                object.put("value", Math.round(rec.getValue()));
                object.put("object", rec.getItemID()); 
                object.put("id_rec", ids_rec_general.get(a2));
                objectsG.put(object);
                a2++;
            }
            JSONObject recommendationsG = new JSONObject();
            recommendationsG.put("recommendations", objectsG);
            
            JSONObject obj_final = new JSONObject();
            obj_final.put("general", recommendationsG);
            obj_final.put("user", iduser);
            
            List<RecommendedItem> listClustersFinal2;
            if(listClustersFinal.size() > 2){
                listClustersFinal2 = listClustersFinal.subList(0, 2);
            }
            else{
                listClustersFinal2 = listClustersFinal;
            }
            ArrayList<Integer> ids_rec_clusters = new ArrayList<Integer>(listClustersFinal2.size());
            for(int a3=0; a3<listClustersFinal2.size();a3++){
                ids_rec_clusters.add(a3, con.addRec(iduser, (int) (long)listClustersFinal2.get(a3).getItemID(), Math.round(listClustersFinal2.get(a3).getValue()), "specific"));
            }
            int a4=0;
            JSONArray objectsC = new JSONArray();
            for(RecommendedItem recC : listClustersFinal2){
                JSONObject object = new JSONObject();
                object.put("value", Math.round(recC.getValue()));
                object.put("object", recC.getItemID()); 
                object.put("id_rec", ids_rec_clusters.get(a4));
                objectsC.put(object);
                a4++;
            }
            JSONObject recommendationsC = new JSONObject();
            recommendationsC.put("recommendations", objectsC);
            obj_final.put("specific", recommendationsC);
            result.put(obj_final);
            
            //System.out.println(objects);
            //result.put("objects", objects);
        }
        fw.append(result.toString(4));
        fw.close();
    }
    
    public static void printList(int iduser, List<RecommendedItem> l){
        System.out.println(iduser);
        for(RecommendedItem item : l){
            System.out.println(item);
        }
        
    }
    
}
