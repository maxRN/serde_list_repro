open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type a = { name : string } [@@deriving deserialize, serialize, yojson]
type t = { x : a list } [@@deriving deserialize, serialize, yojson]

let test = {|
{
  "x": [
    {
      "name": "max"
    }
  ]
}
|}

let () =
  let t = { x = [ { name = "max" } ] } in
  let str2 = Yojson.Safe.from_string test in
  Printf.printf "yojson deserialized to: %s\n" (Yojson.Safe.show str2);

  let str3 = t_of_yojson str2 in
  Printf.printf "ppx yojson deserialized: %s\n"
    (let a = List.nth str3.x 0 in
     a.name);

  let str = Serde_json.to_string serialize_t t |> Result.get_ok in
  Printf.printf "serde serialized to: %s\n" str;
  let maybe = Serde_json.of_string deserialize_t test in
  match maybe with
  | Ok _ -> print_endline "all cool"
  | Error _ -> print_endline "that's bad"
