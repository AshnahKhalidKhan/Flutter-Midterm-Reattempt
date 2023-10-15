import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_reattempt/product_model.dart';
import 'package:http/http.dart' as http;

// ---- Agar is type ki hai kay body['products'] ka andar samaan hai
// https://docs.flutter.dev/cookbook/lists/horizontal-list

Future<List<Products>> _fetchingData() async
{
  final respnse = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (respnse.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(respnse.body)['products'];
    List<Products> _itemsList = List<Products>.from
    (
      _parsedList.map<Products>((dynamic i) => Products.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Erorrr');
  }
}

class MidtermExam extends StatefulWidget
{
  const MidtermExam({super.key});

  @override
  State<MidtermExam> createState() => _MidtermExamState();
}

class _MidtermExamState extends State<MidtermExam>
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.white,
        title: Text('Products', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding
      (
        padding: EdgeInsets.all(5.0),
        child: FutureBuilder
        (
          future: _fetchingData(), 
          builder: (context, snapshot)
          {
            if (snapshot.hasData)
            {
              return _buildingView(snapshot.data!);
            }
            if (snapshot.hasData)
            {
              return Text('$snapshot.error');
            }
            else
            {
              return Center
              (
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      )
    );
  }
}


ListView _buildingView(List<Products> itemsList)
{
  return ListView.builder
  (
    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
    // (
    //   crossAxisCount: 1,
    //   crossAxisSpacing: 10.0,
    //   mainAxisSpacing: 10.0,
    // ),
    itemCount: itemsList.length,
    itemBuilder: (context, i)
    {
      return Card
      (
        color: Colors.white60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Container
            (
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                image: DecorationImage
                (
                  image: NetworkImage(itemsList[i].thumbnail.toString()),
                  fit: BoxFit.cover,
                ),
                // borderRadius: BorderRadius.circular(20.0),
              ),
              // child: Image.network
              // (
              //   itemsList[i].thumbnail.toString(), 
              //   fit: BoxFit.fill,
              // ),
            ),
            Padding
            (
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: 
                [
                  Text(itemsList[i].title),
                  Row
                  (
                    children: 
                    [
                      Text(itemsList[i].price.toString() + " USD"),
                      IconButton
                      (
                        icon: Icon(Icons.remove_red_eye_sharp),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding
            (
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Text(itemsList[i].description.toString()),
            ),
          ],
        ),
      );
      // return Card
      // (
      //   color: Colors.white60,
      //   shape: RoundedRectangleBorder
      //   (
      //     borderRadius: BorderRadius.circular(20.0),
      //   ),
      //   // child: Padding
      //   // (
      //   //   padding: EdgeInsets.all(10.0),
          
      //     child: Column
      //     (
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: 
      //       [
      //         Expanded
      //         (
      //           child: Container
      //           (
      //             alignment: Alignment.topCenter,
      //             width: double.infinity,
      //             // height: double.minPositive,
      //             // height: 50,
      //             decoration: BoxDecoration
      //             (
      //               borderRadius: BorderRadius.circular(20.0),
      //             ),
      //             child: Image.network
      //             (
      //               itemsList[i].thumbnail.toString(),
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //         ),
      //         // Expanded
      //         // (
      //         //   child: Image.network
      //         //   (
      //         //     itemsList[i].thumbnail.toString(),
      //         //     fit: BoxFit.fitWidth,
      //         //   ),
      //         // ),

      //         //  Expanded
      //         // (
      //         //   child: Container
      //         //   (
      //         //     width: double.infinity,
      //         //     decoration: BoxDecoration
      //         //     (
      //         //       borderRadius: BorderRadius.circular(20.0),
      //         //     ),
      //         //     child: Image.network
      //         //     (
      //         //       itemsList[i].thumbnail.toString(),
      //         //       fit: BoxFit.fill,
      //         //     ),
      //         //   ),
      //         // ),
      //         Padding
      //         (
      //           padding: EdgeInsets.only(left:10.0, right: 10.0),
      //           child:
      //           Row
      //           (
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: 
      //             [
                    
      //               // Text(itemsList[i].title, style: TextStyle(fontWeight: FontWeight.bold)),
      //               Text(itemsList[i].title.length > 20 ? '${itemsList[i].title.substring(0, 20)}...' : itemsList[i].title, style: TextStyle(fontWeight: FontWeight.bold)),
      //               Row
      //               (
      //                 children: 
      //                 [
      //                   Text(itemsList[i].price.toString() + " USD", style: TextStyle(fontWeight: FontWeight.bold)),
      //                   IconButton
      //                   (
      //                     icon: Icon(Icons.remove_red_eye_sharp),
      //                     onPressed: ()
      //                     {
      //                       showModalBottomSheet<void>
      //                       (
                            
      //                         shape: RoundedRectangleBorder
      //                         (
      //                           borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      //                         ),
      //                         constraints: BoxConstraints
      //                         (
      //                           // minWidth: double.infinity,
      //                         ),
      //                         // isScrollControlled: true,
      //                         context: context,
      //                         builder: (BuildContext context)
      //                         {
      //                           return Column
      //                           (
      //                             mainAxisSize: MainAxisSize.min,
      //                             mainAxisAlignment: MainAxisAlignment.start,
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: 
      //                             [
      //                               Container
      //                               (
      //                                 margin: const EdgeInsets.symmetric(vertical: 20),
      //                                 height: 150,
      //                                 child: ListView
      //                                 (
      //                                   scrollDirection: Axis.horizontal,
      //                                   children: itemsList[i].images != null && itemsList[i].images.isNotEmpty ? itemsList[i].images.map((imageInList)
      //                                   {
      //                                     return Card
      //                                     (
      //                                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
      //                                       child: Container
      //                                       (
      //                                         decoration: BoxDecoration
      //                                         (
      //                                           borderRadius: BorderRadius.circular(20.0),
      //                                         ),
      //                                         child: Image.network(imageInList, fit: BoxFit.fitHeight, width: 150),
      //                                       ),
      //                                     );
      //                                     // return Image.network(imageInList);
      //                                   }).toList() : <Widget>[],
      //                                 ),
      //                               ),
      //                               ListTile
      //                               (
      //                                 title: Text(itemsList[i].title,style: TextStyle(fontWeight: FontWeight.bold)),
      //                                 subtitle: Text(itemsList[i].description.toString()),
      //                               ),
      //                               ListTile
      //                               (
      //                                 title: Text("\$" + itemsList[i].price.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
      //                               ),
      //                               ListTile
      //                               (
      //                                 title: Row
      //                                 (
      //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                   children: 
      //                                   [
      //                                     Row
      //                                     (
      //                                       children: 
      //                                       [
      //                                         Icon(Icons.star, color: Colors.yellow,),
      //                                         Text(itemsList[i].rating.toString(),),   
      //                                       ],  
      //                                     ),
      //                                     Row
      //                                     (
      //                                       children: 
      //                                       [
      //                                         Text(itemsList[i].discountPercentage.toString() + "%", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
      //                                         Icon(Icons.discount, color: Colors.blue,), 
      //                                       ],  
      //                                     ),
      //                                   ]
      //                                 ),
      //                               ),
      //                             ]
      //                           );
      //                         }
      //                       );
      //                     },
      //                   ),   
      //                 ],  
      //               ),
      //             ]
      //           ),
      //         ),
      //         Padding
      //         (
      //           padding: EdgeInsets.only(left:10.0, right: 10.0, bottom: 10.0),
      //           child:
      //         Text(itemsList[i].description.toString()),
      //         ),
      //       ],
      //     ),
      //   // ),
      // );
    },
  );
}
