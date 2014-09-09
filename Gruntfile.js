module.exports = function(grunt) {
    grunt.initConfig({
        less: {
            development: {
                options: {
                    compress: true
                },
                files: {
                    'TodoListWebApp/Content/css/app.css':'TodoListWebApp/Content/css/less/imports.less'
                }
            }
        },
        watch: {
            styles: {
                files: ['TodoListWebApp/Content/css/**/*.less'],
                tasks: ['less'],
                options: {
                    nospawn: true
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch']);
};