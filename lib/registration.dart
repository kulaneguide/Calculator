import 'package:flutter/material.dart';

import 'lnformation.dart';



class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final items = [
    'Computer Science',
    'Engineerig',
    'Economic',
    'Medicine'
  ];

  String? value;


  TextEditingController dateController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController AdressController = TextEditingController();
  TextEditingController TellController = TextEditingController();


  String? Fullname;
  String? Adress;
  String? Tell;
  String? SelectDate;
  String?Seleclist;
  int? radioChoose;
  late int SelectRadio;

  @override
  void initState() {
    super.initState();
    SelectRadio = 0;
  }

  setSelectRadio(int val) {
    setState(() {
      SelectRadio = val;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton( icon: Icon(Icons.arrow_back),
        //   color: Colors.white,
        //   iconSize: 26,
        //   onPressed: ()=>Navigator.of(context).pop(),
        //
        // ),
        backgroundColor: Colors.green,


        title: Text(
          "Registraion",
          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 11,



      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
          SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(15),
          width: double.infinity,
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20),
          //     boxShadow: [
          //       BoxShadow(
          //           offset: Offset(0,4),
          //           color: Colors.black.withOpacity(.2),
          //           spreadRadius: 6,
          //           blurRadius: 20
          //
          //
          //
          //       )
          //     ]
          // ),

          child: Column(
              children: [
          Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: fullnameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                prefixIconColor: Colors.green,
                label: Text("FullName",style: TextStyle(color: Colors.green,fontSize: 18),),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green)
                )
            ),
          ),
        ),
        SizedBox(),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: AdressController,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on_outlined),
                prefixIconColor: Colors.green,
                label: Text("District",style: TextStyle(color: Colors.green,fontSize: 18),),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green
                    ))
            ),),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: TellController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                prefixIconColor: Colors.green,
                label: Text("Phone number",style: TextStyle(color: Colors.green,fontSize: 18),),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.purpleAccent
                    ))
            ),),
        ),
        Container(
            padding: EdgeInsets.all(20),
            child:   TextField(
                controller: dateController,
                decoration: InputDecoration(
                    label: Text("enter your Birth ",style: TextStyle(fontSize: 18,color: Colors.green),),
                    prefixIcon: IconButton(
                      onPressed: () async{
                        DateTime?  picker=   await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025));
                        setState(() {
                          dateController.text=picker.toString();
                        });
                      }, icon: Icon(Icons.calendar_today),),
                    enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(0)
                    ),
                    focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green
                        )
                    )
                )
            )
        ),
        // Text("Choose Faculty",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

        SizedBox(),
        Container(

          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(

              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(0)

          ),
          child: Center(
              child: DropdownButtonHideUnderline(

                  child: DropdownButton<String>(

                    value: value,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down,size: 35,),
                    items:items.map(buildMenuItem).toList(), onChanged: (value) {
                    setState(() {
                      this.value=value;
                    });
                  },

                  )
              )

          ),
        ),
        Column(
          children: [
        Container(

        child: ButtonBar(
        alignment: MainAxisAlignment.center,
          children: [

            Text("choose your Gender:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Radio(

                value: 1,
                groupValue:SelectRadio,
                activeColor: Colors.green,
                onChanged: (val){
                  setSelectRadio(val!);
                  print("radio is$val");
                }),
            Text("Male",style: TextStyle(fontSize: 18),),

            Radio(

                value: 2,
                groupValue: SelectRadio,
                activeColor: Colors.green,
                onChanged: (val){
                  setSelectRadio(val!);
                  print("radio is$val");
                }),

            Text("Female",style: TextStyle(fontSize:18),),

          ],

        ),
      )
      ],
    )


    ],
    ),
    ),














    Container(
    height: 50,
    width: 340,
    padding: EdgeInsets.all(2),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    elevation: 4,
    backgroundColor: Colors.green,foregroundColor: Colors.white,),
    onPressed: (){
    Fullname=fullnameController.text;
    Adress=AdressController.text;
    Tell=TellController.text;
    SelectDate=dateController.text;
    Seleclist=value.toString();
    radioChoose=SelectRadio;
    // print(Fullname);
    // print(Adress);
    // print(Tell);
    // print(SelectDate);
    // print(Seleclist);
    // print(radioChoose);


    Navigator.push(context, MaterialPageRoute(builder:(context)=>Welcome()));

    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.success,
    //   text: 'Registration was Successfully!',
    // );
    }, child: Text(
    "Submit",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w800),
    )),
    ),


    ],
    ),
    )


    );
  }
  DropdownMenuItem<String>buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }


}
