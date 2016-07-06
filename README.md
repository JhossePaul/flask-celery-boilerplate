# SNA (Social Network Analysis)

Social Network Analysis is a project to fetch, analyze and manage social media data. At
the bottom. SNA is heavily inspired by Social Bakers, Hootsuite, Sprout,
Sprinklr, Mention and other social media analytics. The priority of SNA is data
visualization and deep data analytics. The purpose of SNA is to provide a free, open
source, distributable platform to data analysis, not only data visualization as
the mentioned "analytics" websites, some of these analysis include realtime time
forecasting, text mining, sentiment analysis, automatic public segmentation,
network analysis, among some other machine learning techniques.

## Software Stack

Social Network backend is developed in Python, basically because, besides R, is
the major data analysis programming language and it offers web development
tools. The web framework choosen is Flask.

Databases are easily configurable through SQLAlchemy which provides ORM facilities
for most SQL DBs out there. A posible major change in the future is changing SQL
for Graph Oriented Databases (Neo4j) or Multimodel Databases (ArangoDB). For
message delivery and queue, we have Celery and RabbitMQ.

At the frontend we have a Angular2 + Bootstrap4 + Webpack stack. This may change
for a simpler SAAS based design instead of Bootstrap4 but this is on the long-term
goals list.

## Developer notices and contributing

Any contribution is well recieved.  If you want to contribute and add further 
functionalities to SNA you may be used to Python, Javascript and some
dialects, general web design and server configuration.

# LICENSE
Social Network Analysis is distributed under the GNU AGPLv3 license. You can
find a copy of the terms in the LICENSE file. Basically:

- You can distribute and modify this software.
- Yoy can use Social Network Analysis for private, patent and commercial
  porposes.
- The complete source code for this software must be provided on modifications
  and licensed works.
- Copyright and license notices must be preserved.
- Contributors provide an express grant of patent rights.
- Modified versions that provides network services, must provide the complete
  source code.
