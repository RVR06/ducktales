# How to use the Technology Radar

To support the technical decision making process, software industry is used to leverage technology map which surfaces in a glimpse snapshot of underlying technologies we are building our stack upon while capturing contextual and compelling history track.

This knowledge-sharing tool acts both as breeding ground to feed architecture decision context upstream and as resulting artifact to explicit ADR outcomes downstream. Teaming up ADR and technology radar supports teams for internal and external communication.

## How it is created

The Technology Radar is a collaborative effort. Items come from all team members, including developers, architects, and other stakeholders. We leverage Pull Request flow to propose, discuss, and merge changes to the radar. Each item is a self-contained markdown file, front-matter gathering metadata while body materializes lifecycle meaningful milestones, especially to support decision making process to move from one ring to another, but also evolution within the same ring. History tracking is automatically performed leveraging timestamped directory structure. Versioning is computed based on the number of timestamped directories.

## How should it be used

The radar serves as an overview of technologies that we believe everyone in the teams should be aware of at present.

Its goal is to guide and inspire daily work within the teams. Additionally, it aims to provide valuable information and a high-level perspective to enable decisions to be made with a deeper understanding of the subject matter, resulting in more informed and coordinated choices.

We also hope that developers outside of a given team will find the information in our technology overview inspiring.

We categorize the items into four quadrants, and sometimes, when it's not entirely clear where an item belongs, we choose the best fit.

The quadrants are:

- **Staples**: In this category, we include building blocks we leverage to craft software. Depending of the context, the granularity of said blocks can vary from languages to frameworks, from bare metal STCs to on the shelf services.
- **Security & Compliance**: This quadrant is dedicated to technologies and tools that help streamlining and enforcing security and compliance rules.
- **Platforms & Operations**: In this quadrant, we group technologies related to the operation of software, infrastructure, and platform-related tools and services.
- **Tools & Patterns**: A range of software tools and patterns, from simple productivity enhancers to comprehensive project solutions, catering to various project needs.

Each of the items is classified in one of these rings:

- **Adopt**: We wholeheartedly recommend this technology. It has been extensively used in many teams for an extended period, proving its stability and utility.
- **Trial**: We have successfully implemented this technology and suggest taking a closer look at it in this category. The aim here is to scrutinize these items more closely with the intention of elevating them to the 'Adopt' level.
- **Assess**: We have experimented with this technology and find it promising. We recommend exploring these items when you encounter a specific need for the technology in your project.
- **Hold**: This category is somewhat unique. Unlike the others, it advises discontinuing or refraining from using certain technologies. This does not necessarily imply that they are inherently bad; it often may be acceptable to use them in existing projects. However, we move items here when we believe they should no longer be employed, as we have identified better options or alternatives.

Items can also be tagged to provide filtered radar view.
