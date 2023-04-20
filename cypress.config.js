const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    supportFile: false,
    specPattern: '**/*.js',
    videosFolder: "./videos",
    fileServerFolder: ".",
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
