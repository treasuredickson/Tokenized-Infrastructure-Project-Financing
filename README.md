# Tokenized Infrastructure Project Financing

A blockchain-based system for infrastructure project financing using smart contracts on the Stacks blockchain.

## Overview

This project implements a set of Clarity smart contracts that enable tokenized infrastructure project financing. The system allows for:

- Project verification and validation
- Investment management and token distribution
- Construction milestone tracking
- Revenue distribution to investors

## Smart Contracts

### Project Verification Contract

This contract validates the technical and financial viability of infrastructure projects:

- Register new infrastructure projects
- Assign authorized verifiers
- Verify projects based on technical and financial scores
- Query project status and details

### Investment Management Contract

This contract tracks capital contributions and ownership:

- Initialize projects for investment
- Process investments and issue tokens
- Track investor contributions
- Manage investment rounds

### Construction Milestone Contract

This contract monitors progress against the project plan:

- Define project milestones with budgets and timelines
- Track milestone completion
- Calculate project completion percentage
- Validate construction progress

### Revenue Distribution Contract

This contract allocates income from completed infrastructure:

- Initialize revenue pools for projects
- Add revenue from operational infrastructure
- Calculate investor shares based on token ownership
- Process revenue claims by investors

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - Clarity smart contract development environment
- [Node.js](https://nodejs.org/) - For running tests

### Installation

1. Clone the repository:
   \`\`\`
   git clone https://github.com/yourusername/tokenized-infrastructure.git
   cd tokenized-infrastructure
   \`\`\`

2. Install dependencies:
   \`\`\`
   npm install
   \`\`\`

3. Run tests:
   \`\`\`
   npm test
   \`\`\`

## Usage

### Deploying Contracts

Deploy the contracts to the Stacks blockchain using Clarinet:

\`\`\`
clarinet deploy
\`\`\`

### Example Workflow

1. Register a new infrastructure project
2. Verify the project's technical and financial viability
3. Initialize the project for investment
4. Accept investments and issue tokens
5. Track construction milestones
6. Distribute revenue to token holders

## Testing

The project includes comprehensive tests for all contracts using Vitest:

\`\`\`
npm test
\`\`\`

## License

This project is licensed under the MIT License - see the LICENSE file for details.

