import 'package:xml/xml.dart';
import 'dart:convert';

String parseXML(String xmlStr){
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  Map<String, String?> list = {};
  try{
    final document = XmlDocument.parse(xmlStr);

    var resources = document.findElements("resources");

    if(resources.isNotEmpty){
      var resource = resources.first;
      var  children = resource.children.toList();

      for(var child in children){

        String? dicName;
        String? dicValue;

        for(var attr in child.attributes){
          if (attr.name.local == "name") {
            dicName = attr.value;
          }
        }

        dicValue = child.text;

        if(dicName != null){
          list[dicName] = dicValue;
        }
      }

    }

    var mJson = encoder.convert(list);
    print("mJson: ${(mJson)}  ");
    return (mJson);

  }catch(e){
    print("Document parse error = $e");
    return e.toString();
  }

}
