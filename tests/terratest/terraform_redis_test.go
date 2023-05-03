package test

import (
	"testing"
    "github.com/stretchr/testify/assert"
	"github.com/gruntwork-io/terratest/modules/terraform"

)

func TestTerraformRedis(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../example",
		VarFiles: []string{"terratest.tfvars"},
		Upgrade: true,
	}

	// Defer the destroy to cleanup all created resources
	defer terraform.Destroy(t, terraformOptions)

	// This will init and apply the resources and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Assert inputs with outputs
	outputs_instance_id := terraform.Output(t, terraformOptions, "redis_id")
	//outputs_hostname := terraform.Output(t, terraformOptions, "redis_hostname")
	assert.Equal(t, "[]", outputs_instance_id)
	//assert.Equal(t, "[]", outputs_hostname)
}
