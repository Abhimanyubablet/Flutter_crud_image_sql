// return Scaffold(
//   appBar: AppBar(
//     title: Text("Insert Data insqlite"),
//   ),
//   body: SingleChildScrollView(
//     child: Container(
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(25),
//                   child: Text(
//                       "Regestration Form",
//                       style:TextStyle(fontWeight: FontWeight.bold,fontSize: 23) ),
//                 ),
//               ],
//             ),
//           ),
//
//           Center(
//             child: InkWell(
//               onTap: () {
//                 getImageGallery();
//               },
//               child: Container(
//                 margin: EdgeInsets.all(20),
//                 height: 200,
//                 width: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black,
//                   ),
//                 ),
//                 child: _image != null
//                     ? Image.file(_image!.absolute)
//                     : Center(child: Icon(Icons.image)),
//               ),
//             ),
//           ),
//
//
//           Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.all(15),
//             child: TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 hintText: "Name",
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.all(15),
//             child: TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 hintText: "Email",
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.all(15),
//             child: TextField(
//               controller: contactController,
//               decoration: InputDecoration(
//                 hintText: "Contact",
//               ),
//             ),
//           ),
//
//           Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.all(15),
//             child: ElevatedButton(
//               onPressed: () async {
//                 if (_image != null) {
//                   // Convert image to bytes
//                   List<int> imageBytes = await _image!.readAsBytes();
//
//                   // Convert bytes to base64 (optional, depending on your server implementation)
//                   String base64Image = base64Encode(imageBytes);
//
//                   // Send image to server
//                   var response = await http.post(
//                     Uri.parse('http://example.com/upload'),
//                     body: {
//                       'image': base64Image,
//                       'name': nameController.text,
//                       'email': emailController.text,
//                       'contact': contactController.text,
//                     },
//                   );
//
//                   try {
//                     var result = json.decode(response.body);
//
//                     // Check if the upload was successful (adjust accordingly)
//                     if (result['success']) {
//                       // Insert data into SQLite
//                       await DatabaseHelper.instance.insertRecord({
//                         DatabaseHelper.columnName: nameController.text,
//                         DatabaseHelper.columnEmail: emailController.text,
//                         DatabaseHelper.columnContact: contactController.text,
//                         DatabaseHelper.columnImagePath: result['imagePath'], // adjust the key accordingly
//                       });
//
//                       Navigator.of(context).pop();
//                     } else {
//                       // Handle server response indicating failure
//                       print('Image upload failed. Server response: $result');
//                     }
//                   } catch (e) {
//                     // Handle JSON decoding error
//                     print('Error decoding JSON response: $e');
//                   }
//
//
//                 } else {
//                   // Handle case where no image is selected
//                   print('Please select an image.');
//                 }
//               },
//               child: Text("Submit"),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );