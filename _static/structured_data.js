var structuredData = {
"@context" : "https://schema.org",
"@type" : "WebSite",
"name" : "Foundations of Data Science with Python",
"alternateName" : "FDSP",
"url" : "https://www.fdsp.net/",
"potentialAction": {
"@type": "SearchAction",
"target": {
  "@type": "EntryPoint",
  "urlTemplate": "https://www.fdsp.net/search.html?q={search_term_string}"
},
"query-input": "required name=search_term_string"
}
};

const SDscript = document.createElement('script');
SDscript.setAttribute('type', 'application/ld+json');
SDscript.textContent = JSON.stringify(structuredData);
document.head.appendChild(SDscript);
