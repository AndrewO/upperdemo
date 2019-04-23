    pipeline {
        agent {
            docker { image 'alpine' }
        }
        stages {
            stage('Checkout') {
                steps {
                    git 'https://github.com/AndrewO/upperdemo.git'
                }
            }
            stage('Install') {
                steps {
                    sh 'apk add zip make'
                }
            }
            stage('Zip') {
                steps {
                    sh 'zip master.zip * **/*'
                }
            }

            stage('Upload') {
                steps {
                    withAWS(credentials: 'jenkins', region: 'us-east-1') {
                        s3Upload(file: 'master.zip',
                            bucket: 'andrewo-upperdemo-input',
                            contentEncoding: 'zip',
                            metadatas: [
                                "git_commit:${env.GIT_COMMIT}"
                            ])
                    }
                }
            }
            stage('Clean Up') {
                steps {
                    sh 'make clean'
                    sh 'rm -f master.zip'
                }
            }

        }
    }