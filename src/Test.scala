package services

 import io.circe._, io.circe.generic.semiauto._
 
 case class Foo(i: Int, p: (String, Double))

 object Foo {
   implicit val decodeFoo: Decoder[Foo] = deriveDecoder[Foo]
   implicit val encodeFoo: ObjectEncoder[Foo] = deriveEncoder[Foo]
 }