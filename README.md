<h1>On Archetypes</h1>
<p>An initial prototype for the <strong>Scout</strong> archetype of the <em>Personify</em> reference model. An archetype is a meta-level pattern encountered in many different applications. Archetypes provide general functionality usually required in various contexts.</p>

<p>For example, applications using REST APIs often have a <a href="http://martinfowler.com/eaaCatalog/serviceLayer.html" target="_blank">Service Layer</a> component specifically for external interface with the target API.</p>

<p>Personify manifests this as the <strong>Scout</strong> archetype.</p> 
<h1>Scout</h1>
<p>Like a scout in a warrior group, the <strong>Scout</strong> archtype embodies the responsibility of retrieving information from distant locations.<strong>Scouts</strong> are responsible for knowing:</p>

- how to get to where they need to go (A RetrievalStrategy)  
- what their dispatchers are looking for (A FilteringStrategy)
- how the information they return is to be conveyed (A FormattingStrategy)

<p>An <strong>Scout</strong> provides these basic services:</p>
- get(location, callback, retriever, filterer, formatter)

<h1>Specializations</h1>
<p>A particular type of <strong>Scout</strong>, for example an ESPNScout, would extend the Scout archetype through an application of the <a href="http://addyosmani.com/blog/decorator-pattern/" target="_blank">Decorator pattern</a>and explicitly devise its own retrieval, filtering and formatting strategies by extending the base interfaces and providing their own implemenations.</p>

<h1>Source Layout and contents</h1>
<p>The directory content of <strong>Scout</strong> follows rzr style, adhering to the principles of <a href="http://domaindrivendesign.org/" target="_blank">Domain Driven Design</a> by defining a Bounded Context called domain/ by convention. The domain has separate modules, though it is a rzr guiding principle that blades (plugin components) be as minimalistic as possible. Hence, the <strong>Scout</strong> has one module, scout/.</p>

<p>Each module has an Aggregate Root, conventionally named for the Module (in this case, Archivist.coffee). The Module contains the standard DDD components of Models and Services. Factories and Repositories are option, though the beta applications in <em>Personify</em> have delegated those responsiblities to other Agents (the <strong>Archivist</strong> is the Repository handler).  The Aggregate root exposes the agents the module provides for external interface. Modules in rzr style are Agents, though they may not always be very smart.</p>

<h1>More on Agent Implementation</h1>
<p>A dumb Agent may function much like an ideal <a href="http://java.sun.com/blueprints/patterns/FrontController.html" target="_blank">Front Controller</a> in a traditional Model-View-Controller application, forming an API for the services it provides and delegating requests appropriately.</p> 

<p>More intelligent agents may use reasoning engines to examine their current context, ensure the safety and validity of the information they have been provided, and align their actions with their models of the world, their beliefs, and their goals.</p>

<p><em>Personify</em> Agents are entities with stated contracts, similar to <a href="http://c2.com/cgi/wiki?DesignByContract" target="_blank">Design By Contract</a>. These contracts are written in a <a href="http://c2.com/cgi/wiki?DomainSpecificLanguage" target="_blank">Domain Specific Language</a> for contract generation. These contracts outline their Beliefs, Capabilities, and Commitments. Beliefs expressed in the contracts become  manifested in the <a href="http://martinfowler.com/eaaCatalog/domainModel.html" target="_blank">Domain Model</a>, which is updated and used by the Agent's Brain to update according to change in context and carry out actions.</p> 

<h1>Scout Intent</h1>
<p>The <strong>Scout</strong> archetype is intentionally naive. Domain specific agents should decorate it with context-specific intelligence.</p>

<p>The Scout archetype provides base models for the operations it expects to be able to perform:</p>
- FilteringStrategy
- FormattingStrategy
- RetrievalStrategy

 <p>These applications of the <a href="http://weblog.bocoup.com/the-strategy-pattern-in-javascript/" target="_blank">Strategy Pattern</a> for dynamic replacement. These are essentially interfaces that the Scout expects to use within the <code>get()</code> method. They should be replaced with specific implementations by the decorating scouts.</p>

<p>The <strong>Scout</strong> archetype strives to be <a href="http://www.infoq.com/presentations/Simple-Made-Easy" target="_blank">Simple and Easy</a>, following Rich Hickey's definition. It provides one basic service to the external world, <code>get()</code>. It uses its strategies to get information in the expected format and return it.</p>

<p><strong>Scouts</strong> really should not do more than this. Following the <a href="www.objectmentor.com/resources/articles/srp.pdf" target="_blank">Single Responsibility Principle</a>, they are intended to be specialized agents within an organization, requested by others to collect information from an external provider.</p> 
<p>If feature functionality beyond the simple use case "Retrieve Information X from Place Y that looks like how I want to see it Z" starts to creep into your implementation, YOAR DOING IT WRONG. Refactor that logic elsewhere.</p>
