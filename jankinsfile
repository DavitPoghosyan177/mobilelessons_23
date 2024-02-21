pipeline {
    agent none
    stages {
        stage('Run Tests') {
            parallel {
                stage('Test On Windows') {
                    steps {
                        echo "on windows"
                    }
                    post {
                        always {
                            echo "post"
                        }
                    }
                }
                stage('Test On Linux') {
                    steps {
                        echo "on linux"
                    }
                    post {
                        always {
                            echo "post"
                        }
                    }
                }
            }
        }
    }
}
