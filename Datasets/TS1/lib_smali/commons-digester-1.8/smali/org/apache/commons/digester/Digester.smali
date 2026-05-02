.class public Lorg/apache/commons/digester/Digester;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "Digester.java"


# static fields
.field protected static final W3C_XML_SCHEMA:Ljava/lang/String; = "http://www.w3.org/2001/XMLSchema"


# instance fields
.field protected JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

.field protected bodyText:Ljava/lang/StringBuffer;

.field protected bodyTexts:Lorg/apache/commons/collections/ArrayStack;

.field protected classLoader:Ljava/lang/ClassLoader;

.field protected configured:Z

.field private customContentHandler:Lorg/xml/sax/ContentHandler;

.field protected entityResolver:Lorg/xml/sax/EntityResolver;

.field protected entityValidator:Ljava/util/HashMap;

.field protected errorHandler:Lorg/xml/sax/ErrorHandler;

.field protected factory:Ljavax/xml/parsers/SAXParserFactory;

.field protected inputSources:Ljava/util/List;

.field protected locator:Lorg/xml/sax/Locator;

.field protected log:Lorg/apache/commons/logging/Log;

.field protected match:Ljava/lang/String;

.field protected matches:Lorg/apache/commons/collections/ArrayStack;

.field protected namespaceAware:Z

.field protected namespaces:Ljava/util/HashMap;

.field protected params:Lorg/apache/commons/collections/ArrayStack;

.field protected parser:Ljavax/xml/parsers/SAXParser;

.field protected publicId:Ljava/lang/String;

.field protected reader:Lorg/xml/sax/XMLReader;

.field protected root:Ljava/lang/Object;

.field protected rules:Lorg/apache/commons/digester/Rules;

.field protected saxLog:Lorg/apache/commons/logging/Log;

.field protected schemaLanguage:Ljava/lang/String;

.field protected schemaLocation:Ljava/lang/String;

.field protected stack:Lorg/apache/commons/collections/ArrayStack;

.field private stackAction:Lorg/apache/commons/digester/StackAction;

.field private stacksByName:Ljava/util/HashMap;

.field protected substitutor:Lorg/apache/commons/digester/Substitutor;

.field protected useContextClassLoader:Z

.field protected validating:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 94
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 136
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    .line 142
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyTexts:Lorg/apache/commons/collections/ArrayStack;

    .line 155
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/apache/commons/collections/ArrayStack;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->matches:Lorg/apache/commons/collections/ArrayStack;

    .line 163
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->classLoader:Ljava/lang/ClassLoader;

    .line 169
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->configured:Z

    .line 181
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    .line 188
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    .line 194
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    .line 199
    const-string v0, "http://java.sun.com/xml/jaxp/properties/schemaLanguage"

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    .line 206
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    .line 212
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    .line 218
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    .line 229
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    .line 236
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    .line 242
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    .line 249
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    .line 255
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    .line 262
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    .line 271
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    .line 277
    const-string v0, "http://www.w3.org/2001/XMLSchema"

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->schemaLanguage:Ljava/lang/String;

    .line 283
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    .line 289
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    .line 296
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->useContextClassLoader:Z

    .line 302
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    .line 308
    const-string v0, "org.apache.commons.digester.Digester"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    .line 315
    const-string v0, "org.apache.commons.digester.Digester.sax"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    .line 332
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    .line 343
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    .line 349
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    .line 1896
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->inputSources:Ljava/util/List;

    .line 96
    return-void
.end method

.method public constructor <init>(Ljavax/xml/parsers/SAXParser;)V
    .registers 6
    .param p1, "parser"    # Ljavax/xml/parsers/SAXParser;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 107
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 136
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    .line 142
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyTexts:Lorg/apache/commons/collections/ArrayStack;

    .line 155
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/apache/commons/collections/ArrayStack;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->matches:Lorg/apache/commons/collections/ArrayStack;

    .line 163
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->classLoader:Ljava/lang/ClassLoader;

    .line 169
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->configured:Z

    .line 181
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    .line 188
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    .line 194
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    .line 199
    const-string v0, "http://java.sun.com/xml/jaxp/properties/schemaLanguage"

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    .line 206
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    .line 212
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    .line 218
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    .line 229
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    .line 236
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    .line 242
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    .line 249
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    .line 255
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    .line 262
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    .line 271
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    .line 277
    const-string v0, "http://www.w3.org/2001/XMLSchema"

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->schemaLanguage:Ljava/lang/String;

    .line 283
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    .line 289
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    .line 296
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->useContextClassLoader:Z

    .line 302
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    .line 308
    const-string v0, "org.apache.commons.digester.Digester"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    .line 315
    const-string v0, "org.apache.commons.digester.Digester.sax"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    .line 332
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    .line 343
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    .line 349
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    .line 1896
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->inputSources:Ljava/util/List;

    .line 109
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .registers 6
    .param p1, "reader"    # Lorg/xml/sax/XMLReader;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 123
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 136
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    .line 142
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyTexts:Lorg/apache/commons/collections/ArrayStack;

    .line 155
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/apache/commons/collections/ArrayStack;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->matches:Lorg/apache/commons/collections/ArrayStack;

    .line 163
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->classLoader:Ljava/lang/ClassLoader;

    .line 169
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->configured:Z

    .line 181
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    .line 188
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    .line 194
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    .line 199
    const-string v0, "http://java.sun.com/xml/jaxp/properties/schemaLanguage"

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    .line 206
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    .line 212
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    .line 218
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    .line 229
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    .line 236
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    .line 242
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    .line 249
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    .line 255
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    .line 262
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    .line 271
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    .line 277
    const-string v0, "http://www.w3.org/2001/XMLSchema"

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->schemaLanguage:Ljava/lang/String;

    .line 283
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    .line 289
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    .line 296
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->useContextClassLoader:Z

    .line 302
    iput-boolean v3, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    .line 308
    const-string v0, "org.apache.commons.digester.Digester"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    .line 315
    const-string v0, "org.apache.commons.digester.Digester.sax"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    .line 332
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    .line 343
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    .line 349
    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    .line 1896
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->inputSources:Ljava/util/List;

    .line 125
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    .line 127
    return-void
.end method


# virtual methods
.method public addBeanPropertySetter(Ljava/lang/String;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 2012
    new-instance v0, Lorg/apache/commons/digester/BeanPropertySetterRule;

    invoke-direct {v0}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2015
    return-void
.end method

.method public addBeanPropertySetter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 2028
    new-instance v0, Lorg/apache/commons/digester/BeanPropertySetterRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2031
    return-void
.end method

.method public addCallMethod(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 2042
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2046
    return-void
.end method

.method public addCallMethod(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I

    .prologue
    .line 2060
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2063
    return-void
.end method

.method public addCallMethod(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Class;)V
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I
    .param p4, "paramTypes"    # [Ljava/lang/Class;

    .prologue
    .line 2116
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;I[Ljava/lang/Class;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2122
    return-void
.end method

.method public addCallMethod(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramCount"    # I
    .param p4, "paramTypes"    # [Ljava/lang/String;

    .prologue
    .line 2087
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/commons/digester/CallMethodRule;-><init>(Ljava/lang/String;I[Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2093
    return-void
.end method

.method public addCallParam(Ljava/lang/String;I)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "paramIndex"    # I

    .prologue
    .line 2135
    new-instance v0, Lorg/apache/commons/digester/CallParamRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/CallParamRule;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2138
    return-void
.end method

.method public addCallParam(Ljava/lang/String;II)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "paramIndex"    # I
    .param p3, "stackIndex"    # I

    .prologue
    .line 2187
    new-instance v0, Lorg/apache/commons/digester/CallParamRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/CallParamRule;-><init>(II)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2190
    return-void
.end method

.method public addCallParam(Ljava/lang/String;ILjava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "paramIndex"    # I
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 2154
    new-instance v0, Lorg/apache/commons/digester/CallParamRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/CallParamRule;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2157
    return-void
.end method

.method public addCallParam(Ljava/lang/String;IZ)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "paramIndex"    # I
    .param p3, "fromStack"    # Z

    .prologue
    .line 2171
    new-instance v0, Lorg/apache/commons/digester/CallParamRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/CallParamRule;-><init>(IZ)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2174
    return-void
.end method

.method public addCallParamPath(Ljava/lang/String;I)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "paramIndex"    # I

    .prologue
    .line 2202
    new-instance v0, Lorg/apache/commons/digester/PathCallParamRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/PathCallParamRule;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2203
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 2258
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Ljava/lang/Class;Z)V

    .line 2260
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 2294
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 2296
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "attributeName"    # Ljava/lang/String;
    .param p4, "ignoreCreateExceptions"    # Z

    .prologue
    .line 2398
    new-instance v0, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2402
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/Class;Z)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "ignoreCreateExceptions"    # Z

    .prologue
    .line 2350
    new-instance v0, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;Z)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2354
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 2243
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2245
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 2276
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2278
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "attributeName"    # Ljava/lang/String;
    .param p4, "ignoreCreateExceptions"    # Z

    .prologue
    .line 2374
    new-instance v0, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2378
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "ignoreCreateExceptions"    # Z

    .prologue
    .line 2329
    new-instance v0, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2333
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "creationFactory"    # Lorg/apache/commons/digester/ObjectCreationFactory;

    .prologue
    .line 2311
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;Z)V

    .line 2313
    return-void
.end method

.method public addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;Z)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "creationFactory"    # Lorg/apache/commons/digester/ObjectCreationFactory;
    .param p3, "ignoreCreateExceptions"    # Z

    .prologue
    .line 2419
    invoke-interface {p2, p0}, Lorg/apache/commons/digester/ObjectCreationFactory;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 2420
    new-instance v0, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Lorg/apache/commons/digester/ObjectCreationFactory;Z)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2423
    return-void
.end method

.method public addObjectCreate(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 2449
    new-instance v0, Lorg/apache/commons/digester/ObjectCreateRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2452
    return-void
.end method

.method public addObjectCreate(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 2434
    new-instance v0, Lorg/apache/commons/digester/ObjectCreateRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2437
    return-void
.end method

.method public addObjectCreate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "attributeName"    # Ljava/lang/String;
    .param p3, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 2486
    new-instance v0, Lorg/apache/commons/digester/ObjectCreateRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2489
    return-void
.end method

.method public addObjectCreate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 2467
    new-instance v0, Lorg/apache/commons/digester/ObjectCreateRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2470
    return-void
.end method

.method public addObjectParam(Ljava/lang/String;ILjava/lang/Object;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "paramIndex"    # I
    .param p3, "paramObj"    # Ljava/lang/Object;

    .prologue
    .line 2228
    new-instance v0, Lorg/apache/commons/digester/ObjectParamRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/ObjectParamRule;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2231
    return-void
.end method

.method public addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 1975
    invoke-virtual {p2, p0}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 1976
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/digester/Rules;->add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 1978
    return-void
.end method

.method public addRuleSet(Lorg/apache/commons/digester/RuleSet;)V
    .registers 7
    .param p1, "ruleSet"    # Lorg/apache/commons/digester/RuleSet;

    .prologue
    .line 1988
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRuleNamespaceURI()Ljava/lang/String;

    move-result-object v1

    .line 1989
    .local v1, "oldNamespaceURI":Ljava/lang/String;
    invoke-interface {p1}, Lorg/apache/commons/digester/RuleSet;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 1990
    .local v0, "newNamespaceURI":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 1991
    if-nez v0, :cond_23

    .line 1992
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "addRuleSet() with no namespace URI"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1997
    :cond_19
    :goto_19
    invoke-virtual {p0, v0}, Lorg/apache/commons/digester/Digester;->setRuleNamespaceURI(Ljava/lang/String;)V

    .line 1998
    invoke-interface {p1, p0}, Lorg/apache/commons/digester/RuleSet;->addRuleInstances(Lorg/apache/commons/digester/Digester;)V

    .line 1999
    invoke-virtual {p0, v1}, Lorg/apache/commons/digester/Digester;->setRuleNamespaceURI(Ljava/lang/String;)V

    .line 2001
    return-void

    .line 1994
    :cond_23
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "addRuleSet() with namespace URI "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_19
.end method

.method public addSetNestedProperties(Ljava/lang/String;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 2500
    new-instance v0, Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-direct {v0}, Lorg/apache/commons/digester/SetNestedPropertiesRule;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2501
    return-void
.end method

.method public addSetNestedProperties(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "elementName"    # Ljava/lang/String;
    .param p3, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 2514
    new-instance v0, Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetNestedPropertiesRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2515
    return-void
.end method

.method public addSetNestedProperties(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "elementNames"    # [Ljava/lang/String;
    .param p3, "propertyNames"    # [Ljava/lang/String;

    .prologue
    .line 2528
    new-instance v0, Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetNestedPropertiesRule;-><init>([Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2529
    return-void
.end method

.method public addSetNext(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 2541
    new-instance v0, Lorg/apache/commons/digester/SetNextRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/SetNextRule;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2544
    return-void
.end method

.method public addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramType"    # Ljava/lang/String;

    .prologue
    .line 2561
    new-instance v0, Lorg/apache/commons/digester/SetNextRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetNextRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2564
    return-void
.end method

.method public addSetProperties(Ljava/lang/String;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 2606
    new-instance v0, Lorg/apache/commons/digester/SetPropertiesRule;

    invoke-direct {v0}, Lorg/apache/commons/digester/SetPropertiesRule;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2609
    return-void
.end method

.method public addSetProperties(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "attributeName"    # Ljava/lang/String;
    .param p3, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 2625
    new-instance v0, Lorg/apache/commons/digester/SetPropertiesRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetPropertiesRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2628
    return-void
.end method

.method public addSetProperties(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "attributeNames"    # [Ljava/lang/String;
    .param p3, "propertyNames"    # [Ljava/lang/String;

    .prologue
    .line 2644
    new-instance v0, Lorg/apache/commons/digester/SetPropertiesRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetPropertiesRule;-><init>([Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2647
    return-void
.end method

.method public addSetProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 2660
    new-instance v0, Lorg/apache/commons/digester/SetPropertyRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetPropertyRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2663
    return-void
.end method

.method public addSetRoot(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 2576
    new-instance v0, Lorg/apache/commons/digester/SetRootRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2579
    return-void
.end method

.method public addSetRoot(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramType"    # Ljava/lang/String;

    .prologue
    .line 2593
    new-instance v0, Lorg/apache/commons/digester/SetRootRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2596
    return-void
.end method

.method public addSetTop(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 2675
    new-instance v0, Lorg/apache/commons/digester/SetTopRule;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/SetTopRule;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2678
    return-void
.end method

.method public addSetTop(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramType"    # Ljava/lang/String;

    .prologue
    .line 2695
    new-instance v0, Lorg/apache/commons/digester/SetTopRule;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/SetTopRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 2698
    return-void
.end method

.method public characters([CII)V
    .registers 7
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1087
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    if-eqz v0, :cond_a

    .line 1089
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    invoke-interface {v0, p1, p2, p3}, Lorg/xml/sax/ContentHandler;->characters([CII)V

    .line 1099
    :goto_9
    return-void

    .line 1093
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 1094
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "characters("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1097
    :cond_35
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    goto :goto_9
.end method

.method protected cleanup()V
    .registers 4

    .prologue
    .line 2982
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->inputSources:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 2983
    .local v1, "sources":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_d

    .line 2992
    return-void

    .line 2984
    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/xml/sax/InputSource;

    .line 2986
    .local v0, "source":Lorg/xml/sax/InputSource;
    :try_start_13
    invoke-virtual {v0}, Lorg/xml/sax/InputSource;->getByteStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1a} :catch_1b

    goto :goto_6

    .line 2988
    :catch_1b
    move-exception v2

    goto :goto_6
.end method

.method public clear()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 2715
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    .line 2716
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->bodyTexts:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->clear()V

    .line 2717
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->clear()V

    .line 2718
    iput-object v1, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    .line 2719
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->clear()V

    .line 2720
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 2721
    iput-object v1, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    .line 2722
    return-void
.end method

.method protected configure()V
    .registers 2

    .prologue
    .line 3012
    iget-boolean v0, p0, Lorg/apache/commons/digester/Digester;->configured:Z

    if-eqz v0, :cond_5

    .line 3023
    :goto_4
    return-void

    .line 3017
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->initialize()V

    .line 3021
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/digester/Digester;->configured:Z

    goto :goto_4
.end method

.method public createInputSourceFromURL(Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1958
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/digester/Digester;->createInputSourceFromURL(Ljava/net/URL;)Lorg/xml/sax/InputSource;

    move-result-object v0

    return-object v0
.end method

.method public createInputSourceFromURL(Ljava/net/URL;)Lorg/xml/sax/InputSource;
    .registers 6
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1936
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 1937
    .local v0, "connection":Ljava/net/URLConnection;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 1938
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 1939
    .local v2, "stream":Ljava/io/InputStream;
    new-instance v1, Lorg/xml/sax/InputSource;

    invoke-direct {v1, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 1940
    .local v1, "source":Lorg/xml/sax/InputSource;
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 1941
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->inputSources:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1942
    return-object v1
.end method

.method public createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 3201
    instance-of v1, p1, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_14

    move-object v1, p1

    .line 3202
    check-cast v1, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 3203
    .local v0, "t":Ljava/lang/Throwable;
    if-eqz v0, :cond_14

    instance-of v1, v0, Ljava/lang/Exception;

    if-eqz v1, :cond_14

    move-object p1, v0

    .line 3204
    check-cast p1, Ljava/lang/Exception;

    .line 3207
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_14
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/String;Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v1

    return-object v1
.end method

.method public createSAXException(Ljava/lang/String;)Lorg/xml/sax/SAXException;
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 3217
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/String;Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v0

    return-object v0
.end method

.method public createSAXException(Ljava/lang/String;Ljava/lang/Exception;)Lorg/xml/sax/SAXException;
    .registers 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 3170
    if-eqz p2, :cond_16

    instance-of v2, p2, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v2, :cond_16

    move-object v2, p2

    .line 3172
    check-cast v2, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    .line 3173
    .local v1, "t":Ljava/lang/Throwable;
    if-eqz v1, :cond_16

    instance-of v2, v1, Ljava/lang/Exception;

    if-eqz v2, :cond_16

    move-object p2, v1

    .line 3174
    check-cast p2, Ljava/lang/Exception;

    .line 3177
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_16
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    if-eqz v2, :cond_5f

    .line 3178
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Error at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    invoke-interface {v3}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " char "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    invoke-interface {v3}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3180
    .local v0, "error":Ljava/lang/String;
    if-eqz p2, :cond_57

    .line 3181
    new-instance v2, Lorg/xml/sax/SAXParseException;

    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v2, v0, v3, p2}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    .line 3190
    .end local v0    # "error":Ljava/lang/String;
    :goto_56
    return-object v2

    .line 3183
    .restart local v0    # "error":Ljava/lang/String;
    :cond_57
    new-instance v2, Lorg/xml/sax/SAXParseException;

    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v2, v0, v3}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    goto :goto_56

    .line 3186
    .end local v0    # "error":Ljava/lang/String;
    :cond_5f
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "No Locator!"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 3187
    if-eqz p2, :cond_6e

    .line 3188
    new-instance v2, Lorg/xml/sax/SAXException;

    invoke-direct {v2, p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_56

    .line 3190
    :cond_6e
    new-instance v2, Lorg/xml/sax/SAXException;

    invoke-direct {v2, p1}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    goto :goto_56
.end method

.method public endDocument()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1109
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 1110
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getCount()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_47

    .line 1111
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "endDocument():  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " elements left"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1119
    :cond_31
    :goto_31
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/digester/Rules;->rules()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1120
    .local v2, "rules":Ljava/util/Iterator;
    :goto_3d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4f

    .line 1134
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->clear()V

    .line 1136
    return-void

    .line 1114
    .end local v2    # "rules":Ljava/util/Iterator;
    :cond_47
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    const-string v4, "endDocument()"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_31

    .line 1121
    .restart local v2    # "rules":Ljava/util/Iterator;
    :cond_4f
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/digester/Rule;

    .line 1123
    .local v1, "rule":Lorg/apache/commons/digester/Rule;
    :try_start_55
    invoke-virtual {v1}, Lorg/apache/commons/digester/Rule;->finish()V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_58} :catch_59
    .catch Ljava/lang/Error; {:try_start_55 .. :try_end_58} :catch_66

    goto :goto_3d

    .line 1125
    :catch_59
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Finish event threw exception"

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1126
    invoke-virtual {p0, v0}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v3

    throw v3

    .line 1128
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_66
    move-exception v0

    .local v0, "e":Ljava/lang/Error;
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Finish event threw error"

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1129
    throw v0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 20
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1154
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    if-eqz v13, :cond_14

    .line 1156
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v13, v0, v1, v2}, Lorg/xml/sax/ContentHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1241
    :goto_13
    return-void

    .line 1160
    :cond_14
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v13}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    .line 1162
    .local v4, "debug":Z
    if-eqz v4, :cond_aa

    .line 1163
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v13}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v13

    if-eqz v13, :cond_62

    .line 1164
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "endElement("

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p3

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, ")"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1167
    :cond_62
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "  match=\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1168
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "  bodyText=\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1173
    :cond_aa
    move-object/from16 v8, p2

    .line 1174
    .local v8, "name":Ljava/lang/String;
    if-eqz v8, :cond_b5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x1

    if-ge v13, v14, :cond_b7

    .line 1175
    :cond_b5
    move-object/from16 v8, p3

    .line 1179
    :cond_b7
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->matches:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v13}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    .line 1180
    .local v10, "rules":Ljava/util/List;
    if-eqz v10, :cond_185

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    if-lez v13, :cond_185

    .line 1181
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1182
    .local v3, "bodyText":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/digester/Digester;->getSubstitutor()Lorg/apache/commons/digester/Substitutor;

    move-result-object v12

    .line 1183
    .local v12, "substitutor":Lorg/apache/commons/digester/Substitutor;
    if-eqz v12, :cond_db

    .line 1184
    invoke-virtual {v12, v3}, Lorg/apache/commons/digester/Substitutor;->substitute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1186
    :cond_db
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_dc
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    if-lt v6, v13, :cond_13e

    .line 1208
    .end local v3    # "bodyText":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v12    # "substitutor":Lorg/apache/commons/digester/Substitutor;
    :cond_e2
    :goto_e2
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->bodyTexts:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v13}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/StringBuffer;

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    .line 1209
    if-eqz v4, :cond_11a

    .line 1210
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "  Popping body text \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1214
    :cond_11a
    if-eqz v10, :cond_123

    .line 1215
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_11d
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    if-lt v6, v13, :cond_1ad

    .line 1234
    .end local v6    # "i":I
    :cond_123
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    const/16 v14, 0x2f

    invoke-virtual {v13, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    .line 1235
    .local v11, "slash":I
    if-ltz v11, :cond_1fb

    .line 1236
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    const/4 v14, 0x0

    invoke-virtual {v13, v14, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    goto/16 :goto_13

    .line 1188
    .end local v11    # "slash":I
    .restart local v3    # "bodyText":Ljava/lang/String;
    .restart local v6    # "i":I
    .restart local v12    # "substitutor":Lorg/apache/commons/digester/Substitutor;
    :cond_13e
    :try_start_13e
    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/commons/digester/Rule;

    .line 1189
    .local v9, "rule":Lorg/apache/commons/digester/Rule;
    if-eqz v4, :cond_160

    .line 1190
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "  Fire body() for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1192
    :cond_160
    move-object/from16 v0, p1

    invoke-virtual {v9, v0, v8, v3}, Lorg/apache/commons/digester/Rule;->body(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_165
    .catch Ljava/lang/Exception; {:try_start_13e .. :try_end_165} :catch_169
    .catch Ljava/lang/Error; {:try_start_13e .. :try_end_165} :catch_17a

    .line 1186
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_dc

    .line 1194
    .end local v9    # "rule":Lorg/apache/commons/digester/Rule;
    :catch_169
    move-exception v5

    .local v5, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v14, "Body event threw exception"

    invoke-interface {v13, v14, v5}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1195
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v13

    throw v13

    .line 1197
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_17a
    move-exception v5

    .local v5, "e":Ljava/lang/Error;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v14, "Body event threw error"

    invoke-interface {v13, v14, v5}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1198
    throw v5

    .line 1202
    .end local v3    # "bodyText":Ljava/lang/String;
    .end local v5    # "e":Ljava/lang/Error;
    .end local v6    # "i":I
    .end local v12    # "substitutor":Lorg/apache/commons/digester/Substitutor;
    :cond_185
    if-eqz v4, :cond_e2

    .line 1203
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "  No rules found matching \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "\'."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_e2

    .line 1216
    .restart local v6    # "i":I
    :cond_1ad
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    sub-int/2addr v13, v6

    add-int/lit8 v7, v13, -0x1

    .line 1218
    .local v7, "j":I
    :try_start_1b4
    invoke-interface {v10, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/commons/digester/Rule;

    .line 1219
    .restart local v9    # "rule":Lorg/apache/commons/digester/Rule;
    if-eqz v4, :cond_1d6

    .line 1220
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "  Fire end() for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1222
    :cond_1d6
    move-object/from16 v0, p1

    invoke-virtual {v9, v0, v8}, Lorg/apache/commons/digester/Rule;->end(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1db
    .catch Ljava/lang/Exception; {:try_start_1b4 .. :try_end_1db} :catch_1df
    .catch Ljava/lang/Error; {:try_start_1b4 .. :try_end_1db} :catch_1f0

    .line 1215
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_11d

    .line 1224
    .end local v9    # "rule":Lorg/apache/commons/digester/Rule;
    :catch_1df
    move-exception v5

    .local v5, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v14, "End event threw exception"

    invoke-interface {v13, v14, v5}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1225
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v13

    throw v13

    .line 1227
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_1f0
    move-exception v5

    .local v5, "e":Ljava/lang/Error;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v14, "End event threw error"

    invoke-interface {v13, v14, v5}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1228
    throw v5

    .line 1238
    .end local v5    # "e":Ljava/lang/Error;
    .end local v6    # "i":I
    .end local v7    # "j":I
    .restart local v11    # "slash":I
    :cond_1fb
    const-string v13, ""

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    goto/16 :goto_13
.end method

.method public endPrefixMapping(Ljava/lang/String;)V
    .registers 7
    .param p1, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1253
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 1254
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "endPrefixMapping("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1258
    :cond_26
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/collections/ArrayStack;

    .line 1259
    .local v1, "stack":Lorg/apache/commons/collections/ArrayStack;
    if-nez v1, :cond_31

    .line 1270
    :cond_30
    :goto_30
    return-void

    .line 1263
    :cond_31
    :try_start_31
    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    .line 1264
    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->empty()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 1265
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3f
    .catch Ljava/util/EmptyStackException; {:try_start_31 .. :try_end_3f} :catch_40

    goto :goto_30

    .line 1267
    :catch_40
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    const-string v2, "endPrefixMapping popped too many times"

    invoke-virtual {p0, v2}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/String;)Lorg/xml/sax/SAXException;

    move-result-object v2

    throw v2
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .registers 5
    .param p1, "exception"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1635
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Parse Error at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1638
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    if-eqz v0, :cond_41

    .line 1639
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    invoke-interface {v0, p1}, Lorg/xml/sax/ErrorHandler;->error(Lorg/xml/sax/SAXParseException;)V

    .line 1642
    :cond_41
    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .registers 5
    .param p1, "exception"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1655
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Parse Fatal Error at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1658
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    if-eqz v0, :cond_41

    .line 1659
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    invoke-interface {v0, p1}, Lorg/xml/sax/ErrorHandler;->fatalError(Lorg/xml/sax/SAXParseException;)V

    .line 1662
    :cond_41
    return-void
.end method

.method public findNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 362
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/collections/ArrayStack;

    .line 363
    .local v1, "nsStack":Lorg/apache/commons/collections/ArrayStack;
    if-nez v1, :cond_d

    move-object v2, v3

    .line 369
    :goto_c
    return-object v2

    .line 367
    :cond_d
    :try_start_d
    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_13
    .catch Ljava/util/EmptyStackException; {:try_start_d .. :try_end_13} :catch_14

    goto :goto_c

    .line 369
    :catch_14
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    move-object v2, v3

    goto :goto_c
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 3

    .prologue
    .line 387
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_7

    .line 388
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->classLoader:Ljava/lang/ClassLoader;

    .line 397
    :cond_6
    :goto_6
    return-object v0

    .line 390
    :cond_7
    iget-boolean v1, p0, Lorg/apache/commons/digester/Digester;->useContextClassLoader:Z

    if-eqz v1, :cond_15

    .line 391
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 393
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_6

    .line 397
    .end local v0    # "classLoader":Ljava/lang/ClassLoader;
    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_6
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 421
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v0

    return v0
.end method

.method public getCurrentElementName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 431
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    .line 432
    .local v0, "elementName":Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 433
    .local v1, "lastSlash":I
    if-ltz v1, :cond_10

    .line 434
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 436
    :cond_10
    return-object v0
.end method

.method public getCurrentNamespaces()Ljava/util/Map;
    .registers 7

    .prologue
    .line 1052
    iget-boolean v4, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    if-nez v4, :cond_b

    .line 1053
    iget-object v4, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Digester is not namespace aware"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 1055
    :cond_b
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1056
    .local v0, "currentNamespaces":Ljava/util/Map;
    iget-object v4, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1057
    .local v3, "nsIterator":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_21

    .line 1068
    return-object v0

    .line 1058
    :cond_21
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 1060
    .local v2, "nsEntry":Ljava/util/Map$Entry;
    :try_start_27
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v4}, Lorg/apache/commons/collections/ArrayStack;->peek()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_27 .. :try_end_38} :catch_39

    goto :goto_1a

    .line 1064
    :catch_39
    move-exception v1

    .local v1, "e":Ljava/lang/RuntimeException;
    iget-object v4, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1065
    throw v1
.end method

.method public getCustomContentHandler()Lorg/xml/sax/ContentHandler;
    .registers 2

    .prologue
    .line 983
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    return-object v0
.end method

.method public getDebug()I
    .registers 2

    .prologue
    .line 450
    const/4 v0, 0x0

    return v0
.end method

.method public getDocumentLocator()Lorg/xml/sax/Locator;
    .registers 2

    .prologue
    .line 1329
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    return-object v0
.end method

.method public getEntityResolver()Lorg/xml/sax/EntityResolver;
    .registers 2

    .prologue
    .line 1554
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->entityResolver:Lorg/xml/sax/EntityResolver;

    return-object v0
.end method

.method public getErrorHandler()Lorg/xml/sax/ErrorHandler;
    .registers 2

    .prologue
    .line 477
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    return-object v0
.end method

.method public getFactory()Ljavax/xml/parsers/SAXParserFactory;
    .registers 3

    .prologue
    .line 499
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    if-nez v0, :cond_18

    .line 500
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    .line 501
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    iget-boolean v1, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 502
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    iget-boolean v1, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 504
    :cond_18
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->factory:Ljavax/xml/parsers/SAXParserFactory;

    return-object v0
.end method

.method public getFeature(Ljava/lang/String;)Z
    .registers 3
    .param p1, "feature"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXNotRecognizedException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 528
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/xml/parsers/SAXParserFactory;->getFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getLogger()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 566
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method public getMatch()Ljava/lang/String;
    .registers 2

    .prologue
    .line 609
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespaceAware()Z
    .registers 2

    .prologue
    .line 619
    iget-boolean v0, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    return v0
.end method

.method public getParser()Ljavax/xml/parsers/SAXParser;
    .registers 5

    .prologue
    .line 689
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    if-eqz v2, :cond_7

    .line 690
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    .line 721
    :goto_6
    return-object v2

    .line 695
    :cond_7
    :try_start_7
    iget-boolean v2, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    if-eqz v2, :cond_38

    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    if-eqz v2, :cond_38

    .line 701
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 702
    .local v1, "properties":Ljava/util/Properties;
    const-string v2, "SAXParserFactory"

    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    if-eqz v2, :cond_2f

    .line 704
    const-string v2, "schemaLocation"

    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    const-string v2, "schemaLanguage"

    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->schemaLanguage:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    :cond_2f
    invoke-static {v1}, Lorg/apache/commons/digester/ParserFeatureSetterFactory;->newSAXParser(Ljava/util/Properties;)Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_35} :catch_43

    .line 721
    .end local v1    # "properties":Ljava/util/Properties;
    :goto_35
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;

    goto :goto_6

    .line 714
    :cond_38
    :try_start_38
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/digester/Digester;->parser:Ljavax/xml/parsers/SAXParser;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_42} :catch_43

    goto :goto_35

    .line 717
    :catch_43
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "Digester.getParser: "

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 718
    const/4 v2, 0x0

    goto :goto_6
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "property"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXNotRecognizedException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 742
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/xml/parsers/SAXParser;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getPublicId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 651
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    return-object v0
.end method

.method public getReader()Lorg/xml/sax/XMLReader;
    .registers 4

    .prologue
    .line 779
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_3
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 782
    :goto_4
    return-object v1

    .line 781
    :catch_5
    move-exception v0

    .local v0, "e":Lorg/xml/sax/SAXException;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Cannot get XMLReader"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 782
    const/4 v1, 0x0

    goto :goto_4
.end method

.method getRegistrations()Ljava/util/Map;
    .registers 2

    .prologue
    .line 3058
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    return-object v0
.end method

.method public getRoot()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2947
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v0
.end method

.method public getRuleNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 662
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getRules(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "match"    # Ljava/lang/String;

    .prologue
    .line 3078
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRules()Lorg/apache/commons/digester/Rules;
    .registers 2

    .prologue
    .line 795
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    if-nez v0, :cond_10

    .line 796
    new-instance v0, Lorg/apache/commons/digester/RulesBase;

    invoke-direct {v0}, Lorg/apache/commons/digester/RulesBase;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    .line 797
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p0}, Lorg/apache/commons/digester/Rules;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 799
    :cond_10
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    return-object v0
.end method

.method public getSAXLogger()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 588
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method public getSchema()Ljava/lang/String;
    .registers 2

    .prologue
    .line 823
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemaLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 869
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->schemaLanguage:Ljava/lang/String;

    return-object v0
.end method

.method public getStackAction()Lorg/apache/commons/digester/StackAction;
    .registers 2

    .prologue
    .line 1040
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    return-object v0
.end method

.method public getSubstitutor()Lorg/apache/commons/digester/Substitutor;
    .registers 2

    .prologue
    .line 965
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->substitutor:Lorg/apache/commons/digester/Substitutor;

    return-object v0
.end method

.method public getUseContextClassLoader()Z
    .registers 2

    .prologue
    .line 891
    iget-boolean v0, p0, Lorg/apache/commons/digester/Digester;->useContextClassLoader:Z

    return v0
.end method

.method public getValidating()Z
    .registers 2

    .prologue
    .line 917
    iget-boolean v0, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    return v0
.end method

.method public getXMLReader()Lorg/xml/sax/XMLReader;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 943
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    if-nez v0, :cond_e

    .line 944
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    .line 947
    :cond_e
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setDTDHandler(Lorg/xml/sax/DTDHandler;)V

    .line 948
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 950
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->entityResolver:Lorg/xml/sax/EntityResolver;

    if-nez v0, :cond_29

    .line 951
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 956
    :goto_21
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 957
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    return-object v0

    .line 953
    :cond_29
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->reader:Lorg/xml/sax/XMLReader;

    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->entityResolver:Lorg/xml/sax/EntityResolver;

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    goto :goto_21
.end method

.method public ignorableWhitespace([CII)V
    .registers 7
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1286
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 1287
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "ignorableWhitespace("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1293
    :cond_2b
    return-void
.end method

.method protected initialize()V
    .registers 1

    .prologue
    .line 3048
    return-void
.end method

.method public isEmpty(Ljava/lang/String;)Z
    .registers 5
    .param p1, "stackName"    # Ljava/lang/String;

    .prologue
    .line 2912
    const/4 v1, 0x1

    .line 2913
    .local v1, "result":Z
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/ArrayStack;

    .line 2914
    .local v0, "namedStack":Lorg/apache/commons/collections/ArrayStack;
    if-eqz v0, :cond_f

    .line 2915
    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->isEmpty()Z

    move-result v1

    .line 2917
    :cond_f
    return v1
.end method

.method public log(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1696
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 1698
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 1709
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1711
    return-void
.end method

.method public notationDecl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "publicId"    # Ljava/lang/String;
    .param p3, "systemId"    # Ljava/lang/String;

    .prologue
    .line 1509
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 1510
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "notationDecl("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1514
    :cond_3a
    return-void
.end method

.method public parse(Ljava/io/File;)Ljava/lang/Object;
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1725
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1726
    new-instance v0, Lorg/xml/sax/InputSource;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 1727
    .local v0, "input":Lorg/xml/sax/InputSource;
    invoke-virtual {p1}, Ljava/io/File;->toURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 1728
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1729
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->cleanup()V

    .line 1730
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v1
.end method

.method public parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 4
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1763
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1764
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 1765
    .local v0, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1766
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->cleanup()V

    .line 1767
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v1
.end method

.method public parse(Ljava/io/Reader;)Ljava/lang/Object;
    .registers 4
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1783
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1784
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    .line 1785
    .local v0, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1786
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->cleanup()V

    .line 1787
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v1
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1803
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1804
    invoke-virtual {p0, p1}, Lorg/apache/commons/digester/Digester;->createInputSourceFromURL(Ljava/lang/String;)Lorg/xml/sax/InputSource;

    move-result-object v0

    .line 1805
    .local v0, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1806
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->cleanup()V

    .line 1807
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v1
.end method

.method public parse(Ljava/net/URL;)Ljava/lang/Object;
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1825
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1826
    invoke-virtual {p0, p1}, Lorg/apache/commons/digester/Digester;->createInputSourceFromURL(Ljava/net/URL;)Lorg/xml/sax/InputSource;

    move-result-object v0

    .line 1827
    .local v0, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1828
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->cleanup()V

    .line 1829
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v1
.end method

.method public parse(Lorg/xml/sax/InputSource;)Ljava/lang/Object;
    .registers 3
    .param p1, "input"    # Lorg/xml/sax/InputSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1744
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1745
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1746
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->cleanup()V

    .line 1747
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    return-object v0
.end method

.method public peek()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 2732
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->peek()Ljava/lang/Object;
    :try_end_5
    .catch Ljava/util/EmptyStackException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 2735
    :goto_6
    return-object v1

    .line 2734
    :catch_7
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Empty stack (returning null)"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 2735
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public peek(I)Ljava/lang/Object;
    .registers 5
    .param p1, "n"    # I

    .prologue
    .line 2752
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1, p1}, Lorg/apache/commons/collections/ArrayStack;->peek(I)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/util/EmptyStackException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 2755
    :goto_6
    return-object v1

    .line 2754
    :catch_7
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Empty stack (returning null)"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 2755
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public peek(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "stackName"    # Ljava/lang/String;

    .prologue
    .line 2867
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/Digester;->peek(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public peek(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 8
    .param p1, "stackName"    # Ljava/lang/String;
    .param p2, "n"    # I

    .prologue
    .line 2886
    const/4 v1, 0x0

    .line 2887
    .local v1, "result":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/ArrayStack;

    .line 2888
    .local v0, "namedStack":Lorg/apache/commons/collections/ArrayStack;
    if-nez v0, :cond_37

    .line 2889
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 2890
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Stack \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' is empty"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 2892
    :cond_31
    new-instance v2, Ljava/util/EmptyStackException;

    invoke-direct {v2}, Ljava/util/EmptyStackException;-><init>()V

    throw v2

    .line 2896
    :cond_37
    invoke-virtual {v0, p2}, Lorg/apache/commons/collections/ArrayStack;->peek(I)Ljava/lang/Object;

    move-result-object v1

    .line 2898
    return-object v1
.end method

.method public peekParams()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 3093
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->peek()Ljava/lang/Object;
    :try_end_5
    .catch Ljava/util/EmptyStackException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 3096
    :goto_6
    return-object v1

    .line 3095
    :catch_7
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Empty stack (returning null)"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 3096
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public peekParams(I)Ljava/lang/Object;
    .registers 5
    .param p1, "n"    # I

    .prologue
    .line 3116
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1, p1}, Lorg/apache/commons/collections/ArrayStack;->peek(I)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/util/EmptyStackException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 3119
    :goto_6
    return-object v1

    .line 3118
    :catch_7
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Empty stack (returning null)"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 3119
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public pop()Ljava/lang/Object;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 2768
    :try_start_1
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v3}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    move-result-object v1

    .line 2769
    .local v1, "popped":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    if-eqz v3, :cond_12

    .line 2770
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    const/4 v4, 0x0

    invoke-interface {v3, p0, v4, v1}, Lorg/apache/commons/digester/StackAction;->onPop(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/util/EmptyStackException; {:try_start_1 .. :try_end_11} :catch_13

    move-result-object v1

    .line 2775
    .end local v1    # "popped":Ljava/lang/Object;
    :cond_12
    :goto_12
    return-object v1

    .line 2774
    :catch_13
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    iget-object v3, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Empty stack (returning null)"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    move-object v1, v2

    .line 2775
    goto :goto_12
.end method

.method public pop(Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "stackName"    # Ljava/lang/String;

    .prologue
    .line 2834
    const/4 v1, 0x0

    .line 2835
    .local v1, "result":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/ArrayStack;

    .line 2836
    .local v0, "namedStack":Lorg/apache/commons/collections/ArrayStack;
    if-nez v0, :cond_37

    .line 2837
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 2838
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Stack \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' is empty"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 2840
    :cond_31
    new-instance v2, Ljava/util/EmptyStackException;

    invoke-direct {v2}, Ljava/util/EmptyStackException;-><init>()V

    throw v2

    .line 2843
    :cond_37
    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    move-result-object v1

    .line 2845
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    if-eqz v2, :cond_45

    .line 2846
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    invoke-interface {v2, p0, p1, v1}, Lorg/apache/commons/digester/StackAction;->onPop(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2849
    :cond_45
    return-object v1
.end method

.method public popParams()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 3135
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 3136
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Popping params"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 3138
    :cond_f
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;
    :try_end_14
    .catch Ljava/util/EmptyStackException; {:try_start_0 .. :try_end_14} :catch_16

    move-result-object v1

    .line 3141
    :goto_15
    return-object v1

    .line 3140
    :catch_16
    move-exception v0

    .local v0, "e":Ljava/util/EmptyStackException;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Empty stack (returning null)"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 3141
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public processingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1307
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    if-eqz v0, :cond_a

    .line 1309
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    invoke-interface {v0, p1, p2}, Lorg/xml/sax/ContentHandler;->processingInstruction(Ljava/lang/String;Ljava/lang/String;)V

    .line 1319
    :cond_9
    :goto_9
    return-void

    .line 1313
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1314
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "processingInstruction(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_9
.end method

.method public push(Ljava/lang/Object;)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 2788
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    if-eqz v0, :cond_b

    .line 2789
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1, p1}, Lorg/apache/commons/digester/StackAction;->onPush(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 2792
    :cond_b
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v0

    if-nez v0, :cond_15

    .line 2793
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    .line 2795
    :cond_15
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->stack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2796
    return-void
.end method

.method public push(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "stackName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 2808
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    if-eqz v1, :cond_a

    .line 2809
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    invoke-interface {v1, p0, p1, p2}, Lorg/apache/commons/digester/StackAction;->onPush(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 2812
    :cond_a
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/ArrayStack;

    .line 2813
    .local v0, "namedStack":Lorg/apache/commons/collections/ArrayStack;
    if-nez v0, :cond_1e

    .line 2814
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    .end local v0    # "namedStack":Lorg/apache/commons/collections/ArrayStack;
    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    .line 2815
    .restart local v0    # "namedStack":Lorg/apache/commons/collections/ArrayStack;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->stacksByName:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2817
    :cond_1e
    invoke-virtual {v0, p2}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2818
    return-void
.end method

.method public pushParams(Ljava/lang/Object;)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 3156
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 3157
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Pushing params"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 3159
    :cond_f
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->params:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3161
    return-void
.end method

.method public register(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "entityURL"    # Ljava/lang/String;

    .prologue
    .line 1876
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_30

    .line 1877
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "register(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\', \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1880
    :cond_30
    :try_start_30
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/net/MalformedURLException; {:try_start_30 .. :try_end_3a} :catch_3b

    .line 1886
    return-void

    .line 1882
    :catch_3b
    move-exception v0

    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Malformed URL \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public register(Ljava/lang/String;Ljava/net/URL;)V
    .registers 6
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "entityURL"    # Ljava/net/URL;

    .prologue
    .line 1859
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 1860
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "register(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1862
    :cond_30
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1864
    return-void
.end method

.method public resetRoot()V
    .registers 2

    .prologue
    .line 2961
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    .line 2962
    return-void
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .registers 8
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1569
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 1570
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "resolveEntity(\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\', \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\')"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1573
    :cond_30
    if-eqz p1, :cond_34

    .line 1574
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    .line 1577
    :cond_34
    const/4 v1, 0x0

    .line 1578
    .local v1, "entityURL":Ljava/net/URL;
    if-eqz p1, :cond_3f

    .line 1579
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "entityURL":Ljava/net/URL;
    check-cast v1, Ljava/net/URL;

    .line 1583
    .restart local v1    # "entityURL":Ljava/net/URL;
    :cond_3f
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    if-eqz v2, :cond_4f

    if-nez v1, :cond_4f

    if-eqz p2, :cond_4f

    .line 1584
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->entityValidator:Ljava/util/HashMap;

    invoke-virtual {v2, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "entityURL":Ljava/net/URL;
    check-cast v1, Ljava/net/URL;

    .line 1587
    .restart local v1    # "entityURL":Ljava/net/URL;
    :cond_4f
    if-nez v1, :cond_a6

    .line 1588
    if-nez p2, :cond_7b

    .line 1590
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_79

    .line 1591
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " Cannot resolve entity: \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1593
    :cond_79
    const/4 v2, 0x0

    .line 1615
    :goto_7a
    return-object v2

    .line 1597
    :cond_7b
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_a1

    .line 1598
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " Trying to resolve using system ID \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1601
    :cond_a1
    :try_start_a1
    new-instance v1, Ljava/net/URL;

    .end local v1    # "entityURL":Ljava/net/URL;
    invoke-direct {v1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_a6
    .catch Ljava/net/MalformedURLException; {:try_start_a1 .. :try_end_a6} :catch_d1

    .line 1610
    .restart local v1    # "entityURL":Ljava/net/URL;
    :cond_a6
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_cc

    .line 1611
    iget-object v2, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " Resolving to alternate DTD \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1615
    :cond_cc
    :try_start_cc
    invoke-virtual {p0, v1}, Lorg/apache/commons/digester/Digester;->createInputSourceFromURL(Ljava/net/URL;)Lorg/xml/sax/InputSource;
    :try_end_cf
    .catch Ljava/lang/Exception; {:try_start_cc .. :try_end_cf} :catch_f9

    move-result-object v2

    goto :goto_7a

    .line 1603
    .end local v1    # "entityURL":Ljava/net/URL;
    :catch_d1
    move-exception v0

    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Malformed URL \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1617
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .restart local v1    # "entityURL":Ljava/net/URL;
    :catch_f9
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v2

    throw v2
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .registers 2
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 411
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->classLoader:Ljava/lang/ClassLoader;

    .line 413
    return-void
.end method

.method public setCustomContentHandler(Lorg/xml/sax/ContentHandler;)V
    .registers 2
    .param p1, "handler"    # Lorg/xml/sax/ContentHandler;

    .prologue
    .line 1021
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    .line 1022
    return-void
.end method

.method public setDebug(I)V
    .registers 2
    .param p1, "debug"    # I

    .prologue
    .line 469
    return-void
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .registers 5
    .param p1, "locator"    # Lorg/xml/sax/Locator;

    .prologue
    .line 1340
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 1341
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "setDocumentLocator("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1344
    :cond_26
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->locator:Lorg/xml/sax/Locator;

    .line 1346
    return-void
.end method

.method public setEntityResolver(Lorg/xml/sax/EntityResolver;)V
    .registers 2
    .param p1, "entityResolver"    # Lorg/xml/sax/EntityResolver;

    .prologue
    .line 1545
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->entityResolver:Lorg/xml/sax/EntityResolver;

    .line 1546
    return-void
.end method

.method public setErrorHandler(Lorg/xml/sax/ErrorHandler;)V
    .registers 2
    .param p1, "errorHandler"    # Lorg/xml/sax/ErrorHandler;

    .prologue
    .line 489
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    .line 491
    return-void
.end method

.method public setFeature(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "feature"    # Ljava/lang/String;
    .param p2, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXNotRecognizedException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 556
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 558
    return-void
.end method

.method public setLogger(Lorg/apache/commons/logging/Log;)V
    .registers 2
    .param p1, "log"    # Lorg/apache/commons/logging/Log;

    .prologue
    .line 576
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    .line 578
    return-void
.end method

.method public setNamespaceAware(Z)V
    .registers 2
    .param p1, "namespaceAware"    # Z

    .prologue
    .line 631
    iput-boolean p1, p0, Lorg/apache/commons/digester/Digester;->namespaceAware:Z

    .line 633
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXNotRecognizedException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 764
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljavax/xml/parsers/SAXParser;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 766
    return-void
.end method

.method public setPublicId(Ljava/lang/String;)V
    .registers 2
    .param p1, "publicId"    # Ljava/lang/String;

    .prologue
    .line 641
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->publicId:Ljava/lang/String;

    .line 642
    return-void
.end method

.method public setRuleNamespaceURI(Ljava/lang/String;)V
    .registers 3
    .param p1, "ruleNamespaceURI"    # Ljava/lang/String;

    .prologue
    .line 677
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->setNamespaceURI(Ljava/lang/String;)V

    .line 679
    return-void
.end method

.method public setRules(Lorg/apache/commons/digester/Rules;)V
    .registers 3
    .param p1, "rules"    # Lorg/apache/commons/digester/Rules;

    .prologue
    .line 812
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    .line 813
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->rules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p0}, Lorg/apache/commons/digester/Rules;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 815
    return-void
.end method

.method public setSAXLogger(Lorg/apache/commons/logging/Log;)V
    .registers 2
    .param p1, "saxLog"    # Lorg/apache/commons/logging/Log;

    .prologue
    .line 601
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    .line 602
    return-void
.end method

.method public setSchema(Ljava/lang/String;)V
    .registers 2
    .param p1, "schemaLocation"    # Ljava/lang/String;

    .prologue
    .line 859
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->schemaLocation:Ljava/lang/String;

    .line 861
    return-void
.end method

.method public setSchemaLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "schemaLanguage"    # Ljava/lang/String;

    .prologue
    .line 881
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->schemaLanguage:Ljava/lang/String;

    .line 883
    return-void
.end method

.method public setStackAction(Lorg/apache/commons/digester/StackAction;)V
    .registers 2
    .param p1, "stackAction"    # Lorg/apache/commons/digester/StackAction;

    .prologue
    .line 1031
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->stackAction:Lorg/apache/commons/digester/StackAction;

    .line 1032
    return-void
.end method

.method public setSubstitutor(Lorg/apache/commons/digester/Substitutor;)V
    .registers 2
    .param p1, "substitutor"    # Lorg/apache/commons/digester/Substitutor;

    .prologue
    .line 974
    iput-object p1, p0, Lorg/apache/commons/digester/Digester;->substitutor:Lorg/apache/commons/digester/Substitutor;

    .line 975
    return-void
.end method

.method public setUseContextClassLoader(Z)V
    .registers 2
    .param p1, "use"    # Z

    .prologue
    .line 907
    iput-boolean p1, p0, Lorg/apache/commons/digester/Digester;->useContextClassLoader:Z

    .line 909
    return-void
.end method

.method public setValidating(Z)V
    .registers 2
    .param p1, "validating"    # Z

    .prologue
    .line 930
    iput-boolean p1, p0, Lorg/apache/commons/digester/Digester;->validating:Z

    .line 932
    return-void
.end method

.method public skippedEntity(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1358
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 1359
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "skippedEntity("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1364
    :cond_26
    return-void
.end method

.method public startDocument()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1374
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1375
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    const-string v1, "startDocument()"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1381
    :cond_f
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->configure()V

    .line 1382
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 16
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "list"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1401
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 1403
    .local v0, "debug":Z
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    if-eqz v8, :cond_10

    .line 1405
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->customContentHandler:Lorg/xml/sax/ContentHandler;

    invoke-interface {v8, p1, p2, p3, p4}, Lorg/xml/sax/ContentHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 1468
    :cond_f
    :goto_f
    return-void

    .line 1409
    :cond_10
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_4a

    .line 1410
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "startElement("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1415
    :cond_4a
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->bodyTexts:Lorg/apache/commons/collections/ArrayStack;

    iget-object v9, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    invoke-virtual {v8, v9}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1416
    if-eqz v0, :cond_77

    .line 1417
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "  Pushing body text \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1419
    :cond_77
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v8, p0, Lorg/apache/commons/digester/Digester;->bodyText:Ljava/lang/StringBuffer;

    .line 1423
    move-object v3, p2

    .line 1424
    .local v3, "name":Ljava/lang/String;
    if-eqz v3, :cond_88

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x1

    if-ge v8, v9, :cond_89

    .line 1425
    :cond_88
    move-object v3, p3

    .line 1429
    :cond_89
    new-instance v6, Ljava/lang/StringBuffer;

    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-direct {v6, v8}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1430
    .local v6, "sb":Ljava/lang/StringBuffer;
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_9d

    .line 1431
    const/16 v8, 0x2f

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1433
    :cond_9d
    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1434
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    .line 1435
    if-eqz v0, :cond_c8

    .line 1436
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "  New match=\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1440
    :cond_c8
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-interface {v8, p1, v9}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 1441
    .local v5, "rules":Ljava/util/List;
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->matches:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v8, v5}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1442
    if-eqz v5, :cond_12c

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_12c

    .line 1443
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getSubstitutor()Lorg/apache/commons/digester/Substitutor;

    move-result-object v7

    .line 1444
    .local v7, "substitutor":Lorg/apache/commons/digester/Substitutor;
    if-eqz v7, :cond_e9

    .line 1445
    invoke-virtual {v7, p4}, Lorg/apache/commons/digester/Substitutor;->substitute(Lorg/xml/sax/Attributes;)Lorg/xml/sax/Attributes;

    move-result-object p4

    .line 1447
    :cond_e9
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_ea
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_f

    .line 1449
    :try_start_f0
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/digester/Rule;

    .line 1450
    .local v4, "rule":Lorg/apache/commons/digester/Rule;
    if-eqz v0, :cond_110

    .line 1451
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "  Fire begin() for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1453
    :cond_110
    invoke-virtual {v4, p1, v3, p4}, Lorg/apache/commons/digester/Rule;->begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    :try_end_113
    .catch Ljava/lang/Exception; {:try_start_f0 .. :try_end_113} :catch_116
    .catch Ljava/lang/Error; {:try_start_f0 .. :try_end_113} :catch_123

    .line 1447
    add-int/lit8 v2, v2, 0x1

    goto :goto_ea

    .line 1455
    .end local v4    # "rule":Lorg/apache/commons/digester/Rule;
    :catch_116
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v9, "Begin event threw exception"

    invoke-interface {v8, v9, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1456
    invoke-virtual {p0, v1}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v8

    throw v8

    .line 1458
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_123
    move-exception v1

    .local v1, "e":Ljava/lang/Error;
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v9, "Begin event threw error"

    invoke-interface {v8, v9, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1459
    throw v1

    .line 1463
    .end local v1    # "e":Ljava/lang/Error;
    .end local v2    # "i":I
    .end local v7    # "substitutor":Lorg/apache/commons/digester/Substitutor;
    :cond_12c
    if-eqz v0, :cond_f

    .line 1464
    iget-object v8, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "  No rules found matching \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\'."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_f
.end method

.method public startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1482
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_30

    .line 1483
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "startPrefixMapping("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1487
    :cond_30
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/ArrayStack;

    .line 1488
    .local v0, "stack":Lorg/apache/commons/collections/ArrayStack;
    if-nez v0, :cond_44

    .line 1489
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    .end local v0    # "stack":Lorg/apache/commons/collections/ArrayStack;
    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    .line 1490
    .restart local v0    # "stack":Lorg/apache/commons/collections/ArrayStack;
    iget-object v1, p0, Lorg/apache/commons/digester/Digester;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1492
    :cond_44
    invoke-virtual {v0, p2}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1494
    return-void
.end method

.method public unparsedEntityDecl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "publicId"    # Ljava/lang/String;
    .param p3, "systemId"    # Ljava/lang/String;
    .param p4, "notation"    # Ljava/lang/String;

    .prologue
    .line 1528
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_44

    .line 1529
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->saxLog:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "unparsedEntityDecl("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1533
    :cond_44
    return-void
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .registers 5
    .param p1, "exception"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1674
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    if-eqz v0, :cond_41

    .line 1675
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Parse Warning Error at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1679
    iget-object v0, p0, Lorg/apache/commons/digester/Digester;->errorHandler:Lorg/xml/sax/ErrorHandler;

    invoke-interface {v0, p1}, Lorg/xml/sax/ErrorHandler;->warning(Lorg/xml/sax/SAXParseException;)V

    .line 1682
    :cond_41
    return-void
.end method
