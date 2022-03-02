import 'package:flutter/material.dart';
import 'package:poem_mobile/claim/claims/ui/avatar.dart';
import 'package:poem_mobile/models/claim.dart';
import 'package:poem_mobile/models/models.dart';
import 'package:poem_mobile/helpers/helpers.dart';

class AttachmentItem extends StatelessWidget {
  
  final Attachment attachment;
  final VoidCallback onTap;
  const AttachmentItem({Key key, this.attachment, this.onTap}) : super(key: key);
  
  String getImageAsset() {
    String ext = getExtensionWithPath(attachment.name);
    if(ext == 'jpg' || ext == 'jpeg') {
      return 'assets/images/attatchment_jpeg.png';
    } else if(ext == 'pdf') {
      return 'assets/images/attatchment_pdf.png';
    } else if(ext == 'doc' || ext == 'docx') {
      return 'assets/images/attatchment_doc.png';
    } else {
      return 'assets/images/attatchment_doc.png';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(getImageAsset(), width: 13, fit: BoxFit.fitWidth),
            const SizedBox(width: 5),
            Text(attachment.name, style: TextStyle(fontSize: 9, color: Colors.black))
          ],
        ),
      ),
    );
  }
}

class SimpleFinalClaimListItem extends StatelessWidget {
  
  final Claim claim;
  
  const SimpleFinalClaimListItem({Key key, this.claim}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:claim.isPoemDiscount ? Colors.orange : Color(0xFF218CED), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(offset: Offset(0,5), color: Color(0x20000000))
        ]
      ),
      child: Row(
        children: <Widget>[
          Expanded(flex: 10, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AvatarWidget(),
              const SizedBox(height: 5),
              Text('11/27-12/31/19', style: TextStyle(color: Colors.red, fontSize: 10),),
            ],
          )),      
          Expanded(
            flex: 25,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFB6D3FF),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Billed', style: TextStyle(fontSize: 9, color: Colors.black)),
                      const SizedBox(width: 30),
                      Text('500.00', style: TextStyle(fontSize: 9, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            )
          ),
          Expanded(
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Arnisa text here can also change', style: TextStyle(color: Colors.black, fontSize: 11),),
                AttachmentItem(attachment: Attachment('121.jpeg'), onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AttachmentScreen()));
                }),
                AttachmentItem(attachment: Attachment('Reort15.doc'), onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AttachmentScreen()));
                },),
                AttachmentItem(attachment: Attachment('Reort.pdf'), onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AttachmentScreen()));
                }),
              ],
            ),
          ),
          const SizedBox(width: 10)
        ]
      ),
    );
  }
}