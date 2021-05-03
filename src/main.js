const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const fs = require("fs");

// Handle creating/removing shortcuts on Windows when installing/uninstalling.
if (require('electron-squirrel-startup')) { // eslint-disable-line global-require
  app.quit();
}

const createWindow = () => {
  // Create the browser window.
  const mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences:{
      nodeIntegration: true,
      contextIsolation: false
    }
  });

  // and load the index.html of the app.
  mainWindow.loadURL(MAIN_WINDOW_WEBPACK_ENTRY);

  // Open the DevTools.
//  mainWindow.webContents.openDevTools();
};

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', createWindow);

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
  }
});

// -----------------------------------
// RECEIVE THE PATH FROM THE input and send it to the renderer

ipcMain.on('path', (event, p) => {
  let out = []
  fs.readdir(p, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    }
    files.forEach((item, i) => {
      let fullPath = path.join(p , item)
          fs.readFile(fullPath, 'utf8', function (err,data) {
            if (err) {
              return console.log(err);
            }
            out.push({
              path: fullPath,
              data: data,
              name: item
            })
            if(out.length == files.length){
              event.reply('files', out);
            };
          });
    });
  });
});


ipcMain.on("saveFile", (event, p)=>{
    console.log(p);
    fs.writeFile(p["path"], p["data"], function (err) {
      if (err) return console.log(err);
      console.log(`something saved in ${p["path"]}`);
    });
})
