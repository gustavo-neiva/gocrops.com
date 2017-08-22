var gulp = require('gulp');
var browserSync = require('browser-sync').create();

var setupWatchers = function() {
  gulp.watch(['./app/views/**/*.erb',
              './app/assets/javascripts/**/*.js',
              './app/assets/stylesheets/**/*.scss'], ['reload']);
};

gulp.task('reload', function(){
  return browserSync.reload();
});

gulp.task('init', function() {
  browserSync.init({
    proxy: {
      target: "localhost:3000",
      proxyReq: [
        function(proxyReq) {
          proxyReq.setHeader('X-Forwarded-Host', 'localhost:8000');
        }
      ],
    },
    port: 8000,
    open: true,
    ui: {
      port: 8001
    }
  });

  setupWatchers();
});

gulp.task('default', ['init']);
