# Mega calculator

You've just joined **MegaMaths** as a Cloud / DevOps consultant.

The company has given you the mission of implementing deployment and continuous integration on their latest project: the MegaCalculator.

The MegaCalculator is a Python-coded calculator based on a patented idea: the more unnecessary code, the greater the computing power, although this has never been confirmed.

In this document you will find every points of interest that they have raised.

/!\ Points of attention:

- This is an individual project.
- Your project must be created in a **private** GitHub repository! If we find your repos in public, you will receive a grade of 0 / 20.
- Your report must contain a PDF indicating any bonuses you may have added.

## Dependabot (2 points)

Configure dependabot to check for depencies update.

Do not create a workflow to run dependabot manualy, use the dependabot config file.

You dependabot configuration must check daily for :

- python (poetry) updates
- docker

## Custom action : load-poetry (3 points)

The MegaCalculator utilizes poetry as its package manager. Therefore, in every workflow, you will need to :

- install Python
- set up poetry
- download and load the dependencies.

Your task is to design a custom GitHub action that performs these steps.

This GitHub action must be included in your final output and will be incorporated into each of your workflows.

## Lint Workflow (4 points)

This workflow has several triggering events:

- pull_request
- push
- manual triggers

It must run several **different** and **independant jobs** :

- a static analysis with semgrep (using default rules).
- the execution of the commande `make code-quality`
- a Dockerfile analysis with hadolint (default rules).
- a super-linter execution, only if the event comes from a **pull_request**.

All the jobs must complete even if one of them fails.

## Test Workflow (4 points)

This workflow is designed to run unit tests and generate **execution and code coverage reports**.

It must be run for the three latest major versions of Python:

- Python 3.9
- Python 3.10
- Python 3.11

To simplify the project, test-related commands are listed in a **Makefile**.

First, the tests must be run using the `make tests` command. This will also generate an execution report.

**/!\ Caution**: Your job must run to completion, even if some tests fail.

Once testing is complete, use the commande `make coverage-report` to generate a code coverage report.

Finally, save the reports as artifacts:

- The test execution report: the **report.html** file in the project root.
- Code coverage report: the **htmlcov/** folder in the project root.

/!\ Artifacts must be sent even if some tests fail.

/!\ Some tests will fail, but this is expected in this project. You don't have to modify these tests to make them succeed.

## Release Workflow (5 points)

This workflow should only be triggered when a new tag is created.

First, it must run the tests in the same way as the test workflow.

Then, only if the tests pass, the workflow must perform the following actions:

- Send the project as a wheel to testpypi via poetry.
- Build and publish the Docker image on Docker Hub.

As this project uses [poetry](https://python-poetry.org/) you will to search how to build and publish this project on testpypi.

Given the importance of security, all confidential values such as credentials must be added to the repository secrets.

/!\ Be careful because testpypi resets often its database and your credentials might be revoked while your are working on this project. If this happens you will probably need to recreate and account.

## Bonus (2 points)

You will be expected to add significant additional functionalities to the automation of this project.

As a consultant, your work is expected to go beyond that of a simple implementer, you need to provide added value.

If you make any bonuses, please mention them in a **PDF document** contained in your final output.

## Grading scale

- Functional dependabot : 2 points
- Custom action load-poetry : 3 points
- Lint workflow : 4 points
- Test workflow : 4 points
- Release workflow : 5 points
- Bonus features : 2 points

## Rendu

You must deliver a ZIP containing:

- Project archive ( .zip ).
- A PDF containing explications if you did bonuses.

You will send your delivery to:

- Henri Devigne (henri.devigne@ecole-it.com)

⚠ File extension should be strictly respected. If you deliver file in a different format than expected, the file will be entirely discarded.

/!\ Points of attention:

- This is an individual project.
- Your project must be created in a **private** GitHub repository! If we find your repos in public, you will receive a grade of 0 / 20.
- Your report must contain a PDF indicating any bonuses you may have added.
