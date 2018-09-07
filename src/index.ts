import * as Elm from "./Main";

console.log(Elm);
let app = Elm.Elm.Main.init({
  node: document.getElementById("elm"),
  flags: "flags"
});

app.ports.hello.subscribe(name => console.log(`Hello ${name}!!`));
// this is not hooked up in elm
app.ports.reply.send(12345);
