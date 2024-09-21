pipeline {
    agent any

    stages {

        stage('Terraform runtime') {
            agent {
                docker {
                    image 'hashicorp/terraform'
                    reuseNode true
                    args "-u root --entrypoint=''"
                }
            }

            steps {
                withCredentials([usernamePassword(credentialsId: 'my-aws', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    sh '''
                        terraform version
                        pwd
                        terraform init
                        terraform plan -out=plan.txt
                        terraform apply "plan.txt" -auto-approve
                        #terraform destroy -auto-approve
                        #LATEST_TD_REVISION=$(aws ecs register-task-definition --cli-input-json file://aws/task-definition-prod.json | jq '.taskDefinition.revision')
                        #aws ecs update-service --cluster $AWS_ECS_CLUSTER --service $AWS_ECS_SERVICE_PROD --task-definition $AWS_ECS_TD_PROD:$LATEST_TD_REVISION
                        #aws ecs wait services-stable --cluster $AWS_ECS_CLUSTER --services $AWS_ECS_SERVICE_PROD
                    '''
                }
            }
        }
    }
}
    
