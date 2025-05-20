import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

appbar(String text, Function() onTap) => AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color.fromRGBO(230, 215, 171, 0.8),
              Color.fromARGB(255, 158, 94, 218),
              Color.fromRGBO(154, 156, 238, 0.8),
              Color.fromRGBO(154, 156, 238, 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          // Adds more space at the bottom
        ),
        padding: const EdgeInsets.only(bottom: 24),
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onTap,
      ),
      centerTitle: true,
    );
