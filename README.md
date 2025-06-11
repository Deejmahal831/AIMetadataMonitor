# AIMetadataMonitor
Changes done to the orgs Apex classes or Triggers will collect then send data to an AI source. AI reviews and returns Risk and AI Summary.



For testing, you can run these to scrap changed data then send it to the AI model.
MetadataCollector.snapshotApexComponents();
MetadataAIAnalyzerDirect.analyzeMetadata();
