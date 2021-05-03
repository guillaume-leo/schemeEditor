
import './index.css';

const { ipcRenderer } = require('electron');
import CodeMirror from 'codemirror';
import htmlembedded from 'codemirror/mode/htmlembedded/htmlembedded';
import 'codemirror/mode/scheme/scheme';
import 'codemirror/lib/codemirror.css';
import 'codemirror/addon/display/autorefresh';
import 'codemirror/addon/edit/closebrackets';
import 'codemirror/addon/edit/matchbrackets';
import 'codemirror/theme/liquibyte.css';
import 'codemirror/addon/scroll/simplescrollbars';
import 'codemirror/addon/scroll/simplescrollbars.css';
const parinferCodeMirror = require('../parinfer-codemirror/parinfer-codemirror.js');




var editor = [];
var delBuff='';
var saveBuff='';
var currentPath = '';
var currentBuff = '';

function createBuffer(name, data, path){
  // check if the an editor with the same name exist
  let exist = document.getElementById(name);
  if(exist){
    return console.log("the editor is already open somewhere");
  }

  //create the container
  let container = document.createElement('DIV');
  container.classList.add('cm-container-sub');
  container.id = name
  document.getElementById('cm-container').appendChild(container);
  document.getElementById(name).innerHTML +=
  `    <div class="cm-top">
        <button class="save-button" type="button" name="button" >SAVE</button>
        <div class="name">
          ${name}
        </div>
        <button class="kill-button" type="button"  name="button" >KILL</button>
      </div>`;
  //create textarea
  let textBox = document.createElement('textarea');
  textBox.style.display = "none";
  textBox.id = name + "-box";
  document.getElementById(name).appendChild(textBox);
  //create codemirror
  editor[name] = CodeMirror.fromTextArea(document.getElementById(name + "-box"), {
    autoRefresh:true,
    scrollbarStyle:'overlay',
    lineNumbers: true,
    autofocus: true,
    tabSize: 4,
    mode:'scheme',
    theme:'liquibyte',
    gutters: ["CodeMirror-linenumbers", "breakpoints"],
    autoCloseBrackets: true,
    matchBrackets:true,
    styleActiveLine: {nonEmpty: true},
    styleActiveSelected: true,
  });
  // add parinfer the best
  parinferCodeMirror.init(editor[name]);
  // add the code
  editor[name].setValue(data);
  // if we edit the document save btn appear
  editor[name].on('change', ()=>{
    let saveBtn = document.getElementById(name);
    saveBtn = saveBtn.getElementsByClassName('save-button')[0];
    saveBtn.style.display = "block";
  })
  //KILL BUTTON PART
  let killBtn = document.getElementById(name);
  killBtn = killBtn.getElementsByClassName('kill-button')[0];

  killBtn.onclick = ()=>{
    let saveBtn = document.getElementById(name);
    saveBtn = saveBtn.getElementsByClassName('save-button')[0];
    if(saveBtn.style.display === 'block'){
      currentPath = document.getElementById('path').value;
      document.getElementById('path').value = "";
      delBuff = name;
      document.getElementById('path').placeholder = `${name} as changed, are you sure ? (y/n)`;
      document.getElementById('path').focus();
    }else{
    document.getElementById(name).remove();
    }
  }
  //SAVE BUTTON PART
  let saveBtn = document.getElementById(name);
  saveBtn = saveBtn.getElementsByClassName('save-button')[0];
  saveBtn.onclick = ()=>{
    let filePath = path;
    saveBuff = filePath;
    currentPath = document.getElementById('path').value;
    document.getElementById('path').value = `Change file or press Enter : ${filePath}`;
    currentBuff = name;
    document.getElementById('path').focus();
  }
}



function getLastWordOfString(words) {
    var n = words.split(" ");
    return n[n.length - 1];

}

//---------------------------------------------
// SEND THE CONTENT OF THE "PATH" INPUT ELEMENT
// OR USE IT AT PROMPT TO KILL BUFFER

// get the value of "path" when press "Enter"
   document.getElementById('path').addEventListener('keypress', function(e) {
    if(e.key == 'Enter'){
      if(saveBuff.length > 0){ //SAVE BUFFER PROMPT
        // hide savebtn
        let saveBtn = document.getElementById(currentBuff);
        saveBtn = saveBtn.getElementsByClassName('save-button')[0];
        saveBtn.style.display = "none" ;
        // get data
        let data = editor[currentBuff].getValue();
        //get PATH
        let savePath = document.getElementById('path').value
        savePath = getLastWordOfString(savePath);
        //send the value to main
        const {ipcRenderer} = require('electron')
        ipcRenderer.send('saveFile', {
          data: data,
          path: savePath
        })
        document.getElementById('path').value = currentPath;
        document.getElementById('path').blur();
        ipcRenderer.send('path', currentPath);
      }else if(delBuff == ''){
        let path = document.getElementById('path')
        //send the value to main
        const {ipcRenderer} = require('electron')
        ipcRenderer.send('path', path.value)
        // unselect the input
        path.blur()
      }else{ // KILL BUFFER PROMPT
          let answer = document.getElementById('path').value;
        if(answer == "y"){
          document.getElementById(delBuff).remove();
          document.getElementById('path').value = currentPath;
          document.getElementById('path').blur();
          delBuff = '';
        }else{
          document.getElementById('path').value = currentPath;
          document.getElementById('path').blur();
          delBuff = '';
        }
      }
    }
    });

// the main reply and we create all files in the explorer
    ipcRenderer.on('files', (event, files) => {
      document.getElementById('explorer').innerHTML = "";
      let allFiles = files;
      allFiles.forEach((item, i) => {
        let name=allFiles[i].name;
        let path=allFiles[i].path;
        let data=allFiles[i].data;
        let button = document.createElement("BUTTON");
        button.id = path;
        button.classList.add("filesButton");
        button.innerHTML = name;
        button.style.display = "block";
        button.onclick = ()=>{
          createBuffer(name, data, path);
          button.blur();
          // CREATE CM INSTANCE
        };
        document.getElementById('explorer').appendChild(button);
      });
    });
