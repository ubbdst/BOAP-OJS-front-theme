'use strict';

const gulp = require('gulp');
const sass = require('gulp-sass');

gulp.task('build', function () {
  return gulp.src('./styles/style.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'));
});

gulp.task('watch', function () {
  gulp.watch('./styles/**/*.scss', ['build']);
});
