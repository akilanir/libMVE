.class final Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;
.super Ljava/lang/Object;
.source "ActivityChooserModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/actionbarsherlock/widget/ActivityChooserModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "HistoryLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;


# direct methods
.method private constructor <init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;)V
    .registers 2

    .prologue
    .line 930
    iput-object p1, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;Lcom/actionbarsherlock/widget/ActivityChooserModel$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/actionbarsherlock/widget/ActivityChooserModel;
    .param p2, "x1"    # Lcom/actionbarsherlock/widget/ActivityChooserModel$1;

    .prologue
    .line 930
    invoke-direct {p0, p1}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;-><init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 25

    .prologue
    .line 933
    const/4 v4, 0x0

    .line 935
    .local v4, "fis":Ljava/io/FileInputStream;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v21, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mContext:Landroid/content/Context;
    invoke-static/range {v21 .. v21}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$400(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v22, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static/range {v22 .. v22}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;
    :try_end_18
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_18} :catch_3b

    move-result-object v4

    .line 943
    :try_start_19
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v12

    .line 944
    .local v12, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const/16 v21, 0x0

    move-object/from16 v0, v21

    invoke-interface {v12, v4, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 946
    const/16 v17, 0x0

    .line 947
    .local v17, "type":I
    :goto_26
    const/16 v21, 0x1

    move/from16 v0, v17

    move/from16 v1, v21

    if-eq v0, v1, :cond_3d

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-eq v0, v1, :cond_3d

    .line 948
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v17

    goto :goto_26

    .line 936
    .end local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v17    # "type":I
    :catch_3b
    move-exception v5

    .line 1038
    :cond_3c
    :goto_3c
    return-void

    .line 951
    .restart local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v17    # "type":I
    :cond_3d
    const-string v21, "historical-records"

    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_84

    .line 952
    new-instance v21, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v22, "Share records file does not start with historical-records tag."

    invoke-direct/range {v21 .. v22}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v21
    :try_end_51
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_19 .. :try_end_51} :catch_51
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_51} :catch_ed
    .catchall {:try_start_19 .. :try_end_51} :catchall_159

    .line 1025
    .end local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v17    # "type":I
    :catch_51
    move-exception v20

    .line 1026
    .local v20, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_52
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v21

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Error reading historical recrod file: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v23, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7c
    .catchall {:try_start_52 .. :try_end_7c} :catchall_159

    .line 1030
    if-eqz v4, :cond_3c

    .line 1032
    :try_start_7e
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_81} :catch_82

    goto :goto_3c

    .line 1033
    :catch_82
    move-exception v21

    goto :goto_3c

    .line 956
    .end local v20    # "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v17    # "type":I
    :cond_84
    :try_start_84
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 959
    .local v14, "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :cond_89
    :goto_89
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v17

    .line 960
    const/16 v21, 0x1

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_c7

    .line 990
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v21, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;
    invoke-static/range {v21 .. v21}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$500(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;

    move-result-object v22

    monitor-enter v22
    :try_end_a0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_84 .. :try_end_a0} :catch_51
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_a0} :catch_ed
    .catchall {:try_start_84 .. :try_end_a0} :catchall_159

    .line 991
    :try_start_a0
    new-instance v18, Ljava/util/LinkedHashSet;

    move-object/from16 v0, v18

    invoke-direct {v0, v14}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 998
    .local v18, "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v21, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;
    invoke-static/range {v21 .. v21}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$600(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;

    move-result-object v7

    .line 999
    .local v7, "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    .line 1000
    .local v8, "historicalRecordsCount":I
    add-int/lit8 v9, v8, -0x1

    .local v9, "i":I
    :goto_b7
    if-ltz v9, :cond_160

    .line 1001
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;

    .line 1002
    .local v6, "historicalRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_c4
    .catchall {:try_start_a0 .. :try_end_c4} :catchall_1b1

    .line 1000
    add-int/lit8 v9, v9, -0x1

    goto :goto_b7

    .line 963
    .end local v6    # "historicalRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    .end local v7    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v8    # "historicalRecordsCount":I
    .end local v9    # "i":I
    .end local v18    # "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :cond_c7
    const/16 v21, 0x3

    move/from16 v0, v17

    move/from16 v1, v21

    if-eq v0, v1, :cond_89

    const/16 v21, 0x4

    move/from16 v0, v17

    move/from16 v1, v21

    if-eq v0, v1, :cond_89

    .line 966
    :try_start_d7
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 967
    .local v11, "nodeName":Ljava/lang/String;
    const-string v21, "historical-record"

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_120

    .line 968
    new-instance v21, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v22, "Share records file not well-formed."

    invoke-direct/range {v21 .. v22}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v21
    :try_end_ed
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d7 .. :try_end_ed} :catch_51
    .catch Ljava/io/IOException; {:try_start_d7 .. :try_end_ed} :catch_ed
    .catchall {:try_start_d7 .. :try_end_ed} :catchall_159

    .line 1027
    .end local v11    # "nodeName":Ljava/lang/String;
    .end local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v14    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v17    # "type":I
    :catch_ed
    move-exception v10

    .line 1028
    .local v10, "ioe":Ljava/io/IOException;
    :try_start_ee
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v21

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Error reading historical recrod file: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v23, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_116
    .catchall {:try_start_ee .. :try_end_116} :catchall_159

    .line 1030
    if-eqz v4, :cond_3c

    .line 1032
    :try_start_118
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_11b
    .catch Ljava/io/IOException; {:try_start_118 .. :try_end_11b} :catch_11d

    goto/16 :goto_3c

    .line 1033
    :catch_11d
    move-exception v21

    goto/16 :goto_3c

    .line 971
    .end local v10    # "ioe":Ljava/io/IOException;
    .restart local v11    # "nodeName":Ljava/lang/String;
    .restart local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v14    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v17    # "type":I
    :cond_120
    const/16 v21, 0x0

    :try_start_122
    const-string v22, "activity"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 972
    .local v3, "activity":Ljava/lang/String;
    const/16 v21, 0x0

    const-string v22, "time"

    .line 973
    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    .line 974
    .local v15, "time":J
    const/16 v21, 0x0

    const-string v22, "weight"

    .line 975
    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v19

    .line 977
    .local v19, "weight":F
    new-instance v13, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;

    move-wide v0, v15

    move/from16 v2, v19

    invoke-direct {v13, v3, v0, v1, v2}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;-><init>(Ljava/lang/String;JF)V

    .line 979
    .local v13, "readRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    invoke-interface {v14, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_157
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_122 .. :try_end_157} :catch_51
    .catch Ljava/io/IOException; {:try_start_122 .. :try_end_157} :catch_ed
    .catchall {:try_start_122 .. :try_end_157} :catchall_159

    goto/16 :goto_89

    .line 1030
    .end local v3    # "activity":Ljava/lang/String;
    .end local v11    # "nodeName":Ljava/lang/String;
    .end local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v13    # "readRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    .end local v14    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v15    # "time":J
    .end local v17    # "type":I
    .end local v19    # "weight":F
    :catchall_159
    move-exception v21

    if-eqz v4, :cond_15f

    .line 1032
    :try_start_15c
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_15f
    .catch Ljava/io/IOException; {:try_start_15c .. :try_end_15f} :catch_1b4

    .line 1035
    :cond_15f
    :goto_15f
    throw v21

    .line 1005
    .restart local v7    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v8    # "historicalRecordsCount":I
    .restart local v9    # "i":I
    .restart local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v14    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v17    # "type":I
    .restart local v18    # "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :cond_160
    :try_start_160
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v21

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->size()I

    move-result v23

    move/from16 v0, v21

    move/from16 v1, v23

    if-ne v0, v1, :cond_179

    .line 1006
    monitor-exit v22
    :try_end_16f
    .catchall {:try_start_160 .. :try_end_16f} :catchall_1b1

    .line 1030
    if-eqz v4, :cond_3c

    .line 1032
    :try_start_171
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_174
    .catch Ljava/io/IOException; {:try_start_171 .. :try_end_174} :catch_176

    goto/16 :goto_3c

    .line 1033
    :catch_176
    move-exception v21

    goto/16 :goto_3c

    .line 1010
    :cond_179
    :try_start_179
    invoke-interface {v7}, Ljava/util/List;->clear()V

    .line 1011
    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1013
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v21, v0

    const/16 v23, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v23

    # setter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z
    invoke-static {v0, v1}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$702(Lcom/actionbarsherlock/widget/ActivityChooserModel;Z)Z

    .line 1018
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v21, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHandler:Landroid/os/Handler;
    invoke-static/range {v21 .. v21}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1000(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/os/Handler;

    move-result-object v21

    new-instance v23, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1;

    invoke-direct/range {v23 .. v24}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1;-><init>(Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1024
    monitor-exit v22
    :try_end_1a7
    .catchall {:try_start_179 .. :try_end_1a7} :catchall_1b1

    .line 1030
    if-eqz v4, :cond_3c

    .line 1032
    :try_start_1a9
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_1ac
    .catch Ljava/io/IOException; {:try_start_1a9 .. :try_end_1ac} :catch_1ae

    goto/16 :goto_3c

    .line 1033
    :catch_1ae
    move-exception v21

    goto/16 :goto_3c

    .line 1024
    .end local v7    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v8    # "historicalRecordsCount":I
    .end local v9    # "i":I
    .end local v18    # "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :catchall_1b1
    move-exception v21

    :try_start_1b2
    monitor-exit v22
    :try_end_1b3
    .catchall {:try_start_1b2 .. :try_end_1b3} :catchall_1b1

    :try_start_1b3
    throw v21
    :try_end_1b4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1b3 .. :try_end_1b4} :catch_51
    .catch Ljava/io/IOException; {:try_start_1b3 .. :try_end_1b4} :catch_ed
    .catchall {:try_start_1b3 .. :try_end_1b4} :catchall_159

    .line 1033
    .end local v12    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v14    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v17    # "type":I
    :catch_1b4
    move-exception v22

    goto :goto_15f
.end method
