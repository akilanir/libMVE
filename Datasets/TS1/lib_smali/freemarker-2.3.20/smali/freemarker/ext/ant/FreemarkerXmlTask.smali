.class public Lfreemarker/ext/ant/FreemarkerXmlTask;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "FreemarkerXmlTask.java"


# instance fields
.field private baseDir:Ljava/io/File;

.field private builder:Ljavax/xml/parsers/DocumentBuilder;

.field private final builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

.field private cfg:Lfreemarker/template/Configuration;

.field private destDir:Ljava/io/File;

.field private encoding:Ljava/lang/String;

.field private extension:Ljava/lang/String;

.field private incremental:Z

.field private models:Ljava/lang/String;

.field private final modelsMap:Ljava/util/Map;

.field private parsedTemplate:Lfreemarker/template/Template;

.field private prepareEnvironment:Lfreemarker/ext/ant/JythonAntTask;

.field private prepareModel:Lfreemarker/ext/ant/JythonAntTask;

.field private projectAttribute:Ljava/lang/String;

.field private projectFile:Ljava/io/File;

.field private projectFileLastModified:J

.field private projectNode:Lfreemarker/template/TemplateNodeModel;

.field private projectTemplate:Lfreemarker/template/TemplateModel;

.field private propertiesTemplate:Lfreemarker/template/TemplateModel;

.field private templateDir:Ljava/io/File;

.field private templateEncoding:Ljava/lang/String;

.field private templateFileLastModified:J

.field private templateName:Ljava/lang/String;

.field private userPropertiesTemplate:Lfreemarker/template/TemplateModel;

.field private validation:Z


# direct methods
.method public constructor <init>()V
    .registers 6

    .prologue
    const-wide/16 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 332
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 277
    new-instance v0, Lfreemarker/template/Configuration;

    invoke-direct {v0}, Lfreemarker/template/Configuration;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->cfg:Lfreemarker/template/Configuration;

    .line 296
    iput-wide v3, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateFileLastModified:J

    .line 299
    iput-object v2, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectAttribute:Ljava/lang/String;

    .line 301
    iput-object v2, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    .line 311
    iput-wide v3, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFileLastModified:J

    .line 314
    iput-boolean v1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->incremental:Z

    .line 317
    const-string v0, ".html"

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->extension:Ljava/lang/String;

    .line 319
    const-string v0, "file.encoding"

    invoke-static {v0}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->encoding:Ljava/lang/String;

    .line 320
    iget-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->encoding:Ljava/lang/String;

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateEncoding:Ljava/lang/String;

    .line 321
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->validation:Z

    .line 323
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->models:Ljava/lang/String;

    .line 324
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->modelsMap:Ljava/util/Map;

    .line 333
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 334
    iget-object v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 335
    return-void
.end method

.method private ensureDirectoryFor(Ljava/io/File;)V
    .registers 6
    .param p1, "targetFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 674
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 675
    .local v0, "directory":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_36

    .line 677
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_36

    .line 679
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Unable to create directory: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 683
    :cond_36
    return-void
.end method

.method private generateModels()V
    .registers 11

    .prologue
    const/4 v9, -0x1

    .line 630
    new-instance v4, Ljava/util/StringTokenizer;

    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->models:Ljava/lang/String;

    const-string v8, ",; "

    invoke-direct {v4, v7, v8}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 631
    .local v4, "modelTokenizer":Ljava/util/StringTokenizer;
    :goto_a
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_50

    .line 633
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 634
    .local v3, "modelSpec":Ljava/lang/String;
    const/4 v5, 0x0

    .line 635
    .local v5, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .line 637
    .local v0, "clazz":Ljava/lang/String;
    const/16 v7, 0x3d

    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 638
    .local v6, "sep":I
    if-ne v6, v9, :cond_44

    .line 641
    move-object v0, v3

    .line 642
    const/16 v7, 0x2e

    invoke-virtual {v0, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 643
    .local v1, "dot":I
    if-ne v1, v9, :cond_3d

    .line 646
    move-object v5, v0

    .line 660
    .end local v1    # "dot":I
    :goto_28
    :try_start_28
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->modelsMap:Ljava/util/Map;

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v7, v5, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_35} :catch_36

    goto :goto_a

    .line 662
    :catch_36
    move-exception v2

    .line 664
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 650
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "dot":I
    :cond_3d
    add-int/lit8 v7, v1, 0x1

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_28

    .line 655
    .end local v1    # "dot":I
    :cond_44
    const/4 v7, 0x0

    invoke-virtual {v3, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 656
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_28

    .line 667
    .end local v0    # "clazz":Ljava/lang/String;
    .end local v3    # "modelSpec":Ljava/lang/String;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "sep":I
    :cond_50
    return-void
.end method

.method private process(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)V
    .registers 26
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "xmlFile"    # Ljava/lang/String;
    .param p3, "destDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 529
    const/4 v11, 0x0

    .line 530
    .local v11, "outFile":Ljava/io/File;
    const/4 v9, 0x0

    .line 534
    .local v9, "inFile":Ljava/io/File;
    :try_start_2
    new-instance v10, Ljava/io/File;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v10, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_b
    .catch Lorg/xml/sax/SAXParseException; {:try_start_2 .. :try_end_b} :catch_2c1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_b} :catch_27a

    .line 536
    .end local v9    # "inFile":Ljava/io/File;
    .local v10, "inFile":Ljava/io/File;
    :try_start_b
    new-instance v12, Ljava/io/File;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v19, 0x0

    const/16 v20, 0x2e

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v20

    move-object/from16 v0, p2

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->extension:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-direct {v12, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_41
    .catch Lorg/xml/sax/SAXParseException; {:try_start_b .. :try_end_41} :catch_2c4
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_41} :catch_2ba

    .line 541
    .end local v11    # "outFile":Ljava/io/File;
    .local v12, "outFile":Ljava/io/File;
    :try_start_41
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->incremental:Z

    move/from16 v18, v0

    if-eqz v18, :cond_71

    invoke-virtual {v10}, Ljava/io/File;->lastModified()J

    move-result-wide v18

    invoke-virtual {v12}, Ljava/io/File;->lastModified()J

    move-result-wide v20

    cmp-long v18, v18, v20

    if-gtz v18, :cond_71

    move-object/from16 v0, p0

    iget-wide v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateFileLastModified:J

    move-wide/from16 v18, v0

    invoke-virtual {v12}, Ljava/io/File;->lastModified()J

    move-result-wide v20

    cmp-long v18, v18, v20

    if-gtz v18, :cond_71

    move-object/from16 v0, p0

    iget-wide v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFileLastModified:J

    move-wide/from16 v18, v0

    invoke-virtual {v12}, Ljava/io/File;->lastModified()J

    move-result-wide v20

    cmp-long v18, v18, v20

    if-lez v18, :cond_279

    .line 546
    :cond_71
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lfreemarker/ext/ant/FreemarkerXmlTask;->ensureDirectoryFor(Ljava/io/File;)V

    .line 549
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Input:  "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;I)V

    .line 551
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectTemplate:Lfreemarker/template/TemplateModel;

    move-object/from16 v18, v0

    if-nez v18, :cond_dd

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    move-object/from16 v18, v0

    if-eqz v18, :cond_dd

    .line 552
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builder:Ljavax/xml/parsers/DocumentBuilder;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v3

    .line 553
    .local v3, "doc":Lorg/w3c/dom/Document;
    new-instance v18, Lfreemarker/ext/xml/NodeListModel;

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builder:Ljavax/xml/parsers/DocumentBuilder;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lfreemarker/ext/xml/NodeListModel;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectTemplate:Lfreemarker/template/TemplateModel;

    .line 554
    invoke-static {v3}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectNode:Lfreemarker/template/TemplateNodeModel;

    .line 558
    .end local v3    # "doc":Lorg/w3c/dom/Document;
    :cond_dd
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builder:Ljavax/xml/parsers/DocumentBuilder;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 560
    .local v4, "docNode":Lorg/w3c/dom/Document;
    new-instance v6, Lfreemarker/ext/xml/NodeListModel;

    invoke-direct {v6, v4}, Lfreemarker/ext/xml/NodeListModel;-><init>(Ljava/lang/Object;)V

    .line 561
    .local v6, "document":Lfreemarker/template/TemplateModel;
    invoke-static {v4}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v5

    .line 562
    .local v5, "docNodeModel":Lfreemarker/template/TemplateNodeModel;
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 563
    .local v13, "root":Ljava/util/HashMap;
    const-string v18, "document"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lfreemarker/ext/ant/FreemarkerXmlTask;->insertDefaults(Ljava/util/Map;)V

    .line 568
    new-instance v17, Ljava/io/BufferedWriter;

    new-instance v18, Ljava/io/OutputStreamWriter;

    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->encoding:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v18 .. v20}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct/range {v17 .. v18}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_11a
    .catch Lorg/xml/sax/SAXParseException; {:try_start_41 .. :try_end_11a} :catch_12f
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_11a} :catch_2bd

    .line 571
    .local v17, "writer":Ljava/io/Writer;
    :try_start_11a
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->parsedTemplate:Lfreemarker/template/Template;

    move-object/from16 v18, v0

    if-nez v18, :cond_1a9

    .line 572
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    const-string v19, "No template file specified in build script or in XML file"

    invoke-direct/range {v18 .. v19}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_12a
    .catchall {:try_start_11a .. :try_end_12a} :catchall_12a

    .line 599
    :catchall_12a
    move-exception v18

    :try_start_12b
    invoke-virtual/range {v17 .. v17}, Ljava/io/Writer;->close()V

    throw v18
    :try_end_12f
    .catch Lorg/xml/sax/SAXParseException; {:try_start_12b .. :try_end_12f} :catch_12f
    .catch Ljava/lang/Throwable; {:try_start_12b .. :try_end_12f} :catch_2bd

    .line 606
    .end local v4    # "docNode":Lorg/w3c/dom/Document;
    .end local v5    # "docNodeModel":Lfreemarker/template/TemplateNodeModel;
    .end local v6    # "document":Lfreemarker/template/TemplateModel;
    .end local v13    # "root":Ljava/util/HashMap;
    .end local v17    # "writer":Ljava/io/Writer;
    :catch_12f
    move-exception v15

    move-object v9, v10

    .end local v10    # "inFile":Ljava/io/File;
    .restart local v9    # "inFile":Ljava/io/File;
    move-object v11, v12

    .line 608
    .end local v12    # "outFile":Ljava/io/File;
    .restart local v11    # "outFile":Ljava/io/File;
    .local v15, "spe":Lorg/xml/sax/SAXParseException;
    :goto_132
    move-object v14, v15

    .line 609
    .local v14, "rootCause":Ljava/lang/Throwable;
    invoke-virtual {v15}, Lorg/xml/sax/SAXParseException;->getException()Ljava/lang/Exception;

    move-result-object v18

    if-eqz v18, :cond_13d

    .line 610
    invoke-virtual {v15}, Lorg/xml/sax/SAXParseException;->getException()Ljava/lang/Exception;

    move-result-object v14

    .line 611
    :cond_13d
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "XML parsing error in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;I)V

    .line 612
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Line number "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v15}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;)V

    .line 613
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Column number "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v15}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;)V

    .line 614
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v14, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v18

    .line 574
    .end local v9    # "inFile":Ljava/io/File;
    .end local v11    # "outFile":Ljava/io/File;
    .end local v14    # "rootCause":Ljava/lang/Throwable;
    .end local v15    # "spe":Lorg/xml/sax/SAXParseException;
    .restart local v4    # "docNode":Lorg/w3c/dom/Document;
    .restart local v5    # "docNodeModel":Lfreemarker/template/TemplateNodeModel;
    .restart local v6    # "document":Lfreemarker/template/TemplateModel;
    .restart local v10    # "inFile":Ljava/io/File;
    .restart local v12    # "outFile":Ljava/io/File;
    .restart local v13    # "root":Ljava/util/HashMap;
    .restart local v17    # "writer":Ljava/io/Writer;
    :cond_1a9
    :try_start_1a9
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareModel:Lfreemarker/ext/ant/JythonAntTask;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1f4

    .line 575
    new-instance v16, Ljava/util/HashMap;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashMap;-><init>()V

    .line 576
    .local v16, "vars":Ljava/util/Map;
    const-string v18, "model"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-interface {v0, v1, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    const-string v18, "doc"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectNode:Lfreemarker/template/TemplateNodeModel;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1e7

    .line 579
    const-string v19, "project"

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectNode:Lfreemarker/template/TemplateNodeModel;

    move-object/from16 v18, v0

    check-cast v18, Lfreemarker/ext/dom/NodeModel;

    invoke-virtual/range {v18 .. v18}, Lfreemarker/ext/dom/NodeModel;->getNode()Lorg/w3c/dom/Node;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    :cond_1e7
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareModel:Lfreemarker/ext/ant/JythonAntTask;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lfreemarker/ext/ant/JythonAntTask;->execute(Ljava/util/Map;)V

    .line 583
    .end local v16    # "vars":Ljava/util/Map;
    :cond_1f4
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->parsedTemplate:Lfreemarker/template/Template;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v13, v1}, Lfreemarker/template/Template;->createProcessingEnvironment(Ljava/lang/Object;Ljava/io/Writer;)Lfreemarker/core/Environment;

    move-result-object v8

    .line 584
    .local v8, "env":Lfreemarker/core/Environment;
    invoke-virtual {v8, v5}, Lfreemarker/core/Environment;->setCurrentVisitorNode(Lfreemarker/template/TemplateNodeModel;)V

    .line 585
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareEnvironment:Lfreemarker/ext/ant/JythonAntTask;

    move-object/from16 v18, v0

    if-eqz v18, :cond_250

    .line 586
    new-instance v16, Ljava/util/HashMap;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashMap;-><init>()V

    .line 587
    .restart local v16    # "vars":Ljava/util/Map;
    const-string v18, "env"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-interface {v0, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    const-string v18, "doc"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectNode:Lfreemarker/template/TemplateNodeModel;

    move-object/from16 v18, v0

    if-eqz v18, :cond_243

    .line 590
    const-string v19, "project"

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectNode:Lfreemarker/template/TemplateNodeModel;

    move-object/from16 v18, v0

    check-cast v18, Lfreemarker/ext/dom/NodeModel;

    invoke-virtual/range {v18 .. v18}, Lfreemarker/ext/dom/NodeModel;->getNode()Lorg/w3c/dom/Node;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    :cond_243
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareEnvironment:Lfreemarker/ext/ant/JythonAntTask;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lfreemarker/ext/ant/JythonAntTask;->execute(Ljava/util/Map;)V

    .line 594
    .end local v16    # "vars":Ljava/util/Map;
    :cond_250
    invoke-virtual {v8}, Lfreemarker/core/Environment;->process()V

    .line 595
    invoke-virtual/range {v17 .. v17}, Ljava/io/Writer;->flush()V
    :try_end_256
    .catchall {:try_start_1a9 .. :try_end_256} :catchall_12a

    .line 599
    :try_start_256
    invoke-virtual/range {v17 .. v17}, Ljava/io/Writer;->close()V

    .line 602
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Output: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;I)V
    :try_end_279
    .catch Lorg/xml/sax/SAXParseException; {:try_start_256 .. :try_end_279} :catch_12f
    .catch Ljava/lang/Throwable; {:try_start_256 .. :try_end_279} :catch_2bd

    .line 626
    .end local v4    # "docNode":Lorg/w3c/dom/Document;
    .end local v5    # "docNodeModel":Lfreemarker/template/TemplateNodeModel;
    .end local v6    # "document":Lfreemarker/template/TemplateModel;
    .end local v8    # "env":Lfreemarker/core/Environment;
    .end local v13    # "root":Ljava/util/HashMap;
    .end local v17    # "writer":Ljava/io/Writer;
    :cond_279
    return-void

    .line 616
    .end local v10    # "inFile":Ljava/io/File;
    .end local v12    # "outFile":Ljava/io/File;
    .restart local v9    # "inFile":Ljava/io/File;
    .restart local v11    # "outFile":Ljava/io/File;
    :catch_27a
    move-exception v7

    .line 618
    .local v7, "e":Ljava/lang/Throwable;
    :goto_27b
    if-eqz v11, :cond_2a9

    .line 619
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    move-result v18

    if-nez v18, :cond_2a9

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_2a9

    .line 620
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Failed to delete "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;I)V

    .line 623
    :cond_2a9
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 624
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v18

    .line 616
    .end local v7    # "e":Ljava/lang/Throwable;
    .end local v9    # "inFile":Ljava/io/File;
    .restart local v10    # "inFile":Ljava/io/File;
    :catch_2ba
    move-exception v7

    move-object v9, v10

    .end local v10    # "inFile":Ljava/io/File;
    .restart local v9    # "inFile":Ljava/io/File;
    goto :goto_27b

    .end local v9    # "inFile":Ljava/io/File;
    .end local v11    # "outFile":Ljava/io/File;
    .restart local v10    # "inFile":Ljava/io/File;
    .restart local v12    # "outFile":Ljava/io/File;
    :catch_2bd
    move-exception v7

    move-object v9, v10

    .end local v10    # "inFile":Ljava/io/File;
    .restart local v9    # "inFile":Ljava/io/File;
    move-object v11, v12

    .end local v12    # "outFile":Ljava/io/File;
    .restart local v11    # "outFile":Ljava/io/File;
    goto :goto_27b

    .line 606
    :catch_2c1
    move-exception v15

    goto/16 :goto_132

    .end local v9    # "inFile":Ljava/io/File;
    .restart local v10    # "inFile":Ljava/io/File;
    :catch_2c4
    move-exception v15

    move-object v9, v10

    .end local v10    # "inFile":Ljava/io/File;
    .restart local v9    # "inFile":Ljava/io/File;
    goto/16 :goto_132
.end method

.method private static wrapMap(Ljava/util/Map;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p0, "table"    # Ljava/util/Map;

    .prologue
    .line 687
    new-instance v2, Lfreemarker/template/SimpleHash;

    invoke-direct {v2}, Lfreemarker/template/SimpleHash;-><init>()V

    .line 688
    .local v2, "model":Lfreemarker/template/SimpleHash;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 690
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 691
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lfreemarker/template/SimpleScalar;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_d

    .line 693
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_32
    return-object v2
.end method


# virtual methods
.method public addConfiguredJython(Lfreemarker/ext/ant/JythonAntTask;)V
    .registers 2
    .param p1, "jythonAntTask"    # Lfreemarker/ext/ant/JythonAntTask;

    .prologue
    .line 512
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareEnvironment:Lfreemarker/ext/ant/JythonAntTask;

    .line 513
    return-void
.end method

.method public addConfiguredPrepareEnvironment(Lfreemarker/ext/ant/JythonAntTask;)V
    .registers 2
    .param p1, "prepareEnvironment"    # Lfreemarker/ext/ant/JythonAntTask;

    .prologue
    .line 520
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareEnvironment:Lfreemarker/ext/ant/JythonAntTask;

    .line 521
    return-void
.end method

.method public addConfiguredPrepareModel(Lfreemarker/ext/ant/JythonAntTask;)V
    .registers 2
    .param p1, "prepareModel"    # Lfreemarker/ext/ant/JythonAntTask;

    .prologue
    .line 516
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->prepareModel:Lfreemarker/ext/ant/JythonAntTask;

    .line 517
    return-void
.end method

.method public execute()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    .line 423
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    if-nez v7, :cond_f

    .line 425
    invoke-virtual {p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    .line 427
    :cond_f
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->destDir:Ljava/io/File;

    if-nez v7, :cond_1f

    .line 429
    const-string v4, "destdir attribute must be set!"

    .line 430
    .local v4, "msg":Ljava/lang/String;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v4, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 433
    .end local v4    # "msg":Ljava/lang/String;
    :cond_1f
    const/4 v6, 0x0

    .line 435
    .local v6, "templateFile":Ljava/io/File;
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateDir:Ljava/io/File;

    if-nez v7, :cond_fa

    .line 436
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    if-eqz v7, :cond_f4

    .line 437
    new-instance v6, Ljava/io/File;

    .end local v6    # "templateFile":Ljava/io/File;
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 438
    .restart local v6    # "templateFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isAbsolute()Z

    move-result v7

    if-nez v7, :cond_44

    .line 439
    new-instance v6, Ljava/io/File;

    .end local v6    # "templateFile":Ljava/io/File;
    invoke-virtual {p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v7

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 441
    .restart local v6    # "templateFile":Ljava/io/File;
    :cond_44
    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateDir:Ljava/io/File;

    .line 442
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    .line 447
    :goto_50
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateDir:Ljava/io/File;

    invoke-virtual {p0, v7}, Lfreemarker/ext/ant/FreemarkerXmlTask;->setTemplateDir(Ljava/io/File;)V

    .line 454
    :cond_55
    :goto_55
    if-eqz v6, :cond_5d

    .line 455
    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    iput-wide v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateFileLastModified:J

    .line 459
    :cond_5d
    :try_start_5d
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    if-eqz v7, :cond_6d

    .line 460
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->cfg:Lfreemarker/template/Configuration;

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    iget-object v9, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateEncoding:Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/Template;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->parsedTemplate:Lfreemarker/template/Template;
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_6d} :catch_11e

    .line 467
    :cond_6d
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Transforming into: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->destDir:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v10}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;I)V

    .line 470
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectAttribute:Ljava/lang/String;

    if-eqz v7, :cond_b0

    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectAttribute:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_b0

    .line 472
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    iget-object v9, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectAttribute:Ljava/lang/String;

    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    .line 473
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_129

    .line 474
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    iput-wide v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFileLastModified:J

    .line 483
    :cond_b0
    :goto_b0
    invoke-direct {p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->generateModels()V

    .line 486
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    invoke-virtual {p0, v7}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v5

    .line 488
    .local v5, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v7

    invoke-static {v7}, Lfreemarker/ext/ant/FreemarkerXmlTask;->wrapMap(Ljava/util/Map;)Lfreemarker/template/TemplateModel;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->propertiesTemplate:Lfreemarker/template/TemplateModel;

    .line 489
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getUserProperties()Ljava/util/Hashtable;

    move-result-object v7

    invoke-static {v7}, Lfreemarker/ext/ant/FreemarkerXmlTask;->wrapMap(Ljava/util/Map;)Lfreemarker/template/TemplateModel;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->userPropertiesTemplate:Lfreemarker/template/TemplateModel;

    .line 491
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    iget-boolean v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->validation:Z

    invoke-virtual {v7, v8}, Ljavax/xml/parsers/DocumentBuilderFactory;->setValidating(Z)V

    .line 494
    :try_start_d8
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v7

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->builder:Ljavax/xml/parsers/DocumentBuilder;
    :try_end_e0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_d8 .. :try_end_e0} :catch_14a

    .line 502
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    .line 505
    .local v3, "list":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e5
    array-length v7, v3

    if-ge v1, v7, :cond_157

    .line 507
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    aget-object v8, v3, v1

    iget-object v9, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->destDir:Ljava/io/File;

    invoke-direct {p0, v7, v8, v9}, Lfreemarker/ext/ant/FreemarkerXmlTask;->process(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)V

    .line 505
    add-int/lit8 v1, v1, 0x1

    goto :goto_e5

    .line 445
    .end local v1    # "i":I
    .end local v3    # "list":[Ljava/lang/String;
    .end local v5    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_f4
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateDir:Ljava/io/File;

    goto/16 :goto_50

    .line 448
    :cond_fa
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    if-eqz v7, :cond_55

    .line 449
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->isAbsolute()Z

    move-result v7

    if-eqz v7, :cond_113

    .line 450
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string v8, "Do not specify an absolute location for the template as well as a templateDir"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 452
    :cond_113
    new-instance v6, Ljava/io/File;

    .end local v6    # "templateFile":Ljava/io/File;
    iget-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateDir:Ljava/io/File;

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .restart local v6    # "templateFile":Ljava/io/File;
    goto/16 :goto_55

    .line 463
    :catch_11e
    move-exception v2

    .line 464
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 477
    .end local v2    # "ioe":Ljava/io/IOException;
    :cond_129
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Project file is defined, but could not be located: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v10}, Lfreemarker/ext/ant/FreemarkerXmlTask;->log(Ljava/lang/String;I)V

    .line 479
    const/4 v7, 0x0

    iput-object v7, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectFile:Ljava/io/File;

    goto/16 :goto_b0

    .line 496
    .restart local v5    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    :catch_14a
    move-exception v0

    .line 498
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string v8, "Could not create document builder"

    invoke-virtual {p0}, Lfreemarker/ext/ant/FreemarkerXmlTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v0, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 509
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v1    # "i":I
    .restart local v3    # "list":[Ljava/lang/String;
    :cond_157
    return-void
.end method

.method protected insertDefaults(Ljava/util/Map;)V
    .registers 6
    .param p1, "root"    # Ljava/util/Map;

    .prologue
    .line 698
    const-string v2, "properties"

    iget-object v3, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->propertiesTemplate:Lfreemarker/template/TemplateModel;

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    const-string v2, "userProperties"

    iget-object v3, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->userPropertiesTemplate:Lfreemarker/template/TemplateModel;

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    iget-object v2, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectTemplate:Lfreemarker/template/TemplateModel;

    if-eqz v2, :cond_20

    .line 701
    const-string v2, "project"

    iget-object v3, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectTemplate:Lfreemarker/template/TemplateModel;

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    const-string v2, "project_node"

    iget-object v3, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectNode:Lfreemarker/template/TemplateNodeModel;

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    :cond_20
    iget-object v2, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->modelsMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_4a

    .line 706
    iget-object v2, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->modelsMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_32
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 708
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 709
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_32

    .line 712
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_4a
    return-void
.end method

.method public setBasedir(Ljava/io/File;)V
    .registers 2
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 342
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->baseDir:Ljava/io/File;

    .line 343
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .registers 2
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 352
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->destDir:Ljava/io/File;

    .line 353
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 397
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->encoding:Ljava/lang/String;

    .line 398
    return-void
.end method

.method public setExtension(Ljava/lang/String;)V
    .registers 2
    .param p1, "extension"    # Ljava/lang/String;

    .prologue
    .line 360
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->extension:Ljava/lang/String;

    .line 361
    return-void
.end method

.method public setIncremental(Ljava/lang/String;)V
    .registers 3
    .param p1, "incremental"    # Ljava/lang/String;

    .prologue
    .line 389
    const-string v0, "false"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "no"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "off"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    :goto_19
    iput-boolean v0, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->incremental:Z

    .line 390
    return-void

    .line 389
    :cond_1c
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public setModels(Ljava/lang/String;)V
    .registers 2
    .param p1, "models"    # Ljava/lang/String;

    .prologue
    .line 415
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->models:Ljava/lang/String;

    .line 416
    return-void
.end method

.method public setProjectfile(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectAttribute"    # Ljava/lang/String;

    .prologue
    .line 381
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->projectAttribute:Ljava/lang/String;

    .line 382
    return-void
.end method

.method public setTemplate(Ljava/lang/String;)V
    .registers 2
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 364
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateName:Ljava/lang/String;

    .line 365
    return-void
.end method

.method public setTemplateDir(Ljava/io/File;)V
    .registers 4
    .param p1, "templateDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 368
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateDir:Ljava/io/File;

    .line 370
    :try_start_2
    iget-object v1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->cfg:Lfreemarker/template/Configuration;

    invoke-virtual {v1, p1}, Lfreemarker/template/Configuration;->setDirectoryForTemplateLoading(Ljava/io/File;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_8

    .line 374
    return-void

    .line 371
    :catch_8
    move-exception v0

    .line 372
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setTemplateEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "inputEncoding"    # Ljava/lang/String;

    .prologue
    .line 402
    iput-object p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->templateEncoding:Ljava/lang/String;

    .line 403
    return-void
.end method

.method public setValidation(Z)V
    .registers 2
    .param p1, "validation"    # Z

    .prologue
    .line 410
    iput-boolean p1, p0, Lfreemarker/ext/ant/FreemarkerXmlTask;->validation:Z

    .line 411
    return-void
.end method
