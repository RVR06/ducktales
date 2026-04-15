workspace "Ducktales" "Architecture practice crew — VS Code Copilot agents supporting the Architecture Advice Process" {
	
	model {
		copilot = softwareSystem "Corporate Copilot" "VS Code Copilot extension backed by corporate Azure OpenAI — provides LLM inference to all agents" "#external, #copilot"
		
		structurizr = softwareSystem "Structurizr" "Renders and publishes Structurizr DSL diagrams produced by the C4 Modeler" "#external, #structurizr"
		
		github = softwareSystem "Git" "Version controls all artifacts produced in the practice" "#external, #github, #db"
		
		ducktales = softwareSystem "Ducktales" "Architecture practice tooling — Copilot agents, templates, and persisted artifacts" "#ducktales" {
			instructions = container "Workspace Instructions" "Always-on conventions injected into every agent: crew roster, DSL style rules, AAP flow" "Markdown"
			
			templates = container "Templates" "MADR ADR template and tech radar entry template consumed by specialist agents" "Filesystem" "#file"
			
			artifacts = container "Artifact Store" "decisions/, diagrams/, radar/ — persisted and version-controlled outputs" "Filesystem" "#file" {
				-> github "version-controlled by"
			}
			
			solreviewer = container "Solution Reviewer" "ARB review from the solution architecture lens: fitness, coherence, failure modes" "Copilot Agent" "#agent"
			
			datareviewer = container "Data Reviewer" "ARB review from the data architecture lens: models, flows, ownership, compliance" "Copilot Agent" "#agent"
			
			infrareviewer = container "Infrastructure Reviewer" "ARB review from the infrastructure lens: topology, reliability, security, operability" "Copilot Agent" "#agent"
			
			discovery = container "Discovery" "Gathers structured context and produces the Structured Brief before any specialist starts" "Copilot Agent" "#agent"
			
			modeler = container "C4 Modeler" "Produces valid Structurizr DSL from a Structured Brief" "Copilot Agent" "#agent" {
				-> artifacts "writes DSL diagrams to"
				-> structurizr "renders diagrams via"
			}
			
			adrwriter = container "ADR Writer" "Writes MADR-format Architecture Decision Records, sequentially numbered" "Copilot Agent" "#agent" {
				-> artifacts "writes ADRs to"
				-> templates "reads ADR template from"
			}
			
			radar = container "Tech Radar" "Assesses technologies and places them in a quadrant and ring" "Copilot Agent" "#agent" {
				-> artifacts "writes radar entries to"
				-> templates "reads radar entry template from"
			}
			
			communicator = container "Communicator" "Translates technical artifacts into audience-appropriate stakeholder communication" "Copilot Agent" "#agent" {
				-> artifacts "reads source artifacts from and writes stakeholder outputs to"
			}
			
			arbchair = container "ARB Chair" "Orchestrates three specialist reviewers in parallel and synthesises a GO/NO-GO board decision" "Copilot Agent" "#agent" {
				-> solreviewer "orchestrates solution review via"
				-> datareviewer "orchestrates data review via"
				-> infrareviewer "orchestrates infrastructure review via"
				-> artifacts "writes board decision to"
			}
			
			captain = container "Captain" "Orchestrates full AAP workflows and routes requests to specialist agents" "Copilot Agent" "#agent" {
				-> instructions "reads crew conventions from"
				-> arbchair "triggers review board via"
			}
			
			-> copilot "sends prompts to"
		}
		
		architect = person "Architect" "Enterprise architect, captain of the crew and sole decision authority (AAP)" "" {
			-> ducktales "triggers"
		}
	}
	
	views {
		systemContext ducktales "C4_1" "System context — Ducktales architecture practice" {
			include *
		}
		
		container ducktales "C4_2" "Containers — Ducktales architecture practice crew" {
			include *
		}
		
		properties {
			"structurizr.sort" "created"
		}
		
		styles {
			element "#agent" {
				shape Robot
			}
			element "#ducktales" {
				stroke #02529C
				icon ducktales.svg
			}
			element "#copilot" {
				stroke #0D7377
			}
			element "#structurizr" {
				stroke #7C3AED
			}
			element "#git" {
				stroke #F4511E
			}
		}
		
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/topology/theme.json
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/heraldry2/theme.json
	}
}
