# netdevops-puppet-enterprise
Using Puppet Enterprise as a SDN controller to automate several pieces of a modern data center network in a leaf spine configuration.  This demonstration was used at Puppet Camp Tampa (Dec 1, 2015) and Puppet Camp Atlanta (Dec 3, 2015) "Using Devops Tools For Modern Data Centers" by Sean Cavanaugh, Sr Consultant at Cumulus Networks  

Full pptx is downloadable for free here: https://cumulusnetworks.box.com/puppetcamp-netdevops-december

## Topology
Here is the topology for the demonstration:

![Topology](https://raw.githubusercontent.com/seanx820/netdevops/master/topology.png)

## Manifest descriptions
- /etc/puppetlabs/code/environment/production/manifests/site.pp - this is the main manifest to provision the network with [OSPF Unnumbered](http://docs.cumulusnetworks.com/display/CL25/Open+Shortest+Path+First+-+OSPF+-+Protocol).  Each node is given a single IP address instead of burning (using up) an IP address per link.
- /etc/puppetlabs/code/environment/spine2swap/manifests/site.pp - this manifest runs when spine2 (4.4.4.4) has been identified to have a bad fan

## Contributing
Make pull requests at any time, just leave descriptions... this is more of a sandbox.  Please email me at sean @ cumulusnetworks.com if you want more information or demos to play with.  We have heaps on our [Demo Website](https://support.cumulusnetworks.com/hc/en-us/sections/200398866)

***

### Cumulus Linux

Cumulus Linux is a software distribution that runs on top of industry standard 
networking hardware. It enables the latest Linux applications and automation 
tools on networking gear while delivering new levels of innovation and 
ﬂexibility to the data center.

For further details please see: [cumulusnetworks.com](http://www.cumulusnetworks.com)
