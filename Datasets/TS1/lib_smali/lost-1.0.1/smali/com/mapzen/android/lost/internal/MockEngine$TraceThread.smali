.class Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;
.super Ljava/lang/Thread;
.source "MockEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mapzen/android/lost/internal/MockEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TraceThread"
.end annotation


# instance fields
.field private canceled:Z

.field final synthetic this$0:Lcom/mapzen/android/lost/internal/MockEngine;


# direct methods
.method private constructor <init>(Lcom/mapzen/android/lost/internal/MockEngine;)V
    .registers 2

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->this$0:Lcom/mapzen/android/lost/internal/MockEngine;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mapzen/android/lost/internal/MockEngine;Lcom/mapzen/android/lost/internal/MockEngine$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/mapzen/android/lost/internal/MockEngine;
    .param p2, "x1"    # Lcom/mapzen/android/lost/internal/MockEngine$1;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;-><init>(Lcom/mapzen/android/lost/internal/MockEngine;)V

    return-void
.end method

.method static synthetic access$200(Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->canceled:Z

    return v0
.end method

.method private nodeToLocation(Lorg/w3c/dom/NodeList;Lorg/w3c/dom/NodeList;I)Landroid/location/Location;
    .registers 10
    .param p1, "nodeList"    # Lorg/w3c/dom/NodeList;
    .param p2, "speedList"    # Lorg/w3c/dom/NodeList;
    .param p3, "i"    # I

    .prologue
    .line 124
    invoke-interface {p1, p3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 125
    .local v3, "node":Lorg/w3c/dom/Node;
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v4

    const-string v5, "lat"

    invoke-interface {v4, v5}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "lat":Ljava/lang/String;
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v4

    const-string v5, "lon"

    invoke-interface {v4, v5}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "lng":Ljava/lang/String;
    new-instance v2, Landroid/location/Location;

    const-string v4, "mock"

    invoke-direct {v2, v4}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 129
    .local v2, "location":Landroid/location/Location;
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Landroid/location/Location;->setLatitude(D)V

    .line 130
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Landroid/location/Location;->setLongitude(D)V

    .line 131
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Landroid/location/Location;->setTime(J)V

    .line 132
    invoke-interface {p2, p3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    invoke-virtual {v2, v4}, Landroid/location/Location;->setSpeed(F)V

    .line 134
    return-object v2
.end method

.method private parse(Lorg/w3c/dom/NodeList;Lorg/w3c/dom/NodeList;)V
    .registers 5
    .param p1, "nodeList"    # Lorg/w3c/dom/NodeList;
    .param p2, "speedList"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 115
    if-eqz p1, :cond_16

    .line 116
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_16

    .line 117
    invoke-direct {p0, p1, p2, v0}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->nodeToLocation(Lorg/w3c/dom/NodeList;Lorg/w3c/dom/NodeList;I)Landroid/location/Location;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->postMockLocation(Landroid/location/Location;)V

    .line 118
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->sleepFastestInterval()V

    .line 116
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 121
    .end local v0    # "i":I
    :cond_16
    return-void
.end method

.method private postMockLocation(Landroid/location/Location;)V
    .registers 4
    .param p1, "mockLocation"    # Landroid/location/Location;

    .prologue
    .line 148
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->this$0:Lcom/mapzen/android/lost/internal/MockEngine;

    invoke-virtual {v1}, Lcom/mapzen/android/lost/internal/MockEngine;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;

    invoke-direct {v1, p0, p1}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;-><init>(Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;Landroid/location/Location;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 156
    return-void
.end method

.method private sleepFastestInterval()V
    .registers 4

    .prologue
    .line 138
    iget-object v1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->this$0:Lcom/mapzen/android/lost/internal/MockEngine;

    invoke-virtual {v1}, Lcom/mapzen/android/lost/internal/MockEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v1

    if-eqz v1, :cond_15

    .line 140
    :try_start_8
    iget-object v1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->this$0:Lcom/mapzen/android/lost/internal/MockEngine;

    invoke-virtual {v1}, Lcom/mapzen/android/lost/internal/MockEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mapzen/android/lost/api/LocationRequest;->getFastestInterval()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_15
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_15} :catch_16

    .line 145
    :cond_15
    :goto_15
    return-void

    .line 141
    :catch_16
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->canceled:Z

    goto :goto_15
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->canceled:Z

    .line 82
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->interrupt()V

    .line 83
    return-void
.end method

.method public run()V
    .registers 13

    .prologue
    .line 87
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v5

    .line 88
    .local v5, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v10

    invoke-virtual {v10}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v9

    .line 89
    .local v9, "xPath":Ljavax/xml/xpath/XPath;
    const-string v4, "//trkpt"

    .line 90
    .local v4, "expression":Ljava/lang/String;
    const-string v7, "//speed"

    .line 92
    .local v7, "speedExpression":Ljava/lang/String;
    const/4 v6, 0x0

    .line 93
    .local v6, "nodeList":Lorg/w3c/dom/NodeList;
    const/4 v8, 0x0

    .line 95
    .local v8, "speedList":Lorg/w3c/dom/NodeList;
    :try_start_12
    invoke-virtual {v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 96
    .local v1, "builder":Ljavax/xml/parsers/DocumentBuilder;
    iget-object v10, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->this$0:Lcom/mapzen/android/lost/internal/MockEngine;

    # getter for: Lcom/mapzen/android/lost/internal/MockEngine;->traceFile:Ljava/io/File;
    invoke-static {v10}, Lcom/mapzen/android/lost/internal/MockEngine;->access$100(Lcom/mapzen/android/lost/internal/MockEngine;)Ljava/io/File;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 97
    .local v2, "document":Lorg/w3c/dom/Document;
    const-string v10, "//trkpt"

    invoke-interface {v9, v10}, Ljavax/xml/xpath/XPath;->compile(Ljava/lang/String;)Ljavax/xml/xpath/XPathExpression;

    move-result-object v10

    sget-object v11, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    invoke-interface {v10, v2, v11}, Ljavax/xml/xpath/XPathExpression;->evaluate(Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lorg/w3c/dom/NodeList;

    move-object v6, v0

    .line 99
    const-string v10, "//speed"

    invoke-interface {v9, v10}, Ljavax/xml/xpath/XPath;->compile(Ljava/lang/String;)Ljavax/xml/xpath/XPathExpression;

    move-result-object v10

    sget-object v11, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    invoke-interface {v10, v2, v11}, Ljavax/xml/xpath/XPathExpression;->evaluate(Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lorg/w3c/dom/NodeList;

    move-object v8, v0
    :try_end_40
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_12 .. :try_end_40} :catch_44
    .catch Lorg/xml/sax/SAXException; {:try_start_12 .. :try_end_40} :catch_49
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_40} :catch_4e
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_12 .. :try_end_40} :catch_53

    .line 111
    .end local v1    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v2    # "document":Lorg/w3c/dom/Document;
    :goto_40
    invoke-direct {p0, v6, v8}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->parse(Lorg/w3c/dom/NodeList;Lorg/w3c/dom/NodeList;)V

    .line 112
    return-void

    .line 101
    :catch_44
    move-exception v3

    .line 102
    .local v3, "e":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_40

    .line 103
    .end local v3    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_49
    move-exception v3

    .line 104
    .local v3, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_40

    .line 105
    .end local v3    # "e":Lorg/xml/sax/SAXException;
    :catch_4e
    move-exception v3

    .line 106
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_40

    .line 107
    .end local v3    # "e":Ljava/io/IOException;
    :catch_53
    move-exception v3

    .line 108
    .local v3, "e":Ljavax/xml/xpath/XPathExpressionException;
    invoke-virtual {v3}, Ljavax/xml/xpath/XPathExpressionException;->printStackTrace()V

    goto :goto_40
.end method
