.class final Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;
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
    name = "HistoryPersister"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;


# direct methods
.method private constructor <init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;)V
    .registers 2

    .prologue
    .line 1044
    iput-object p1, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;Lcom/actionbarsherlock/widget/ActivityChooserModel$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/actionbarsherlock/widget/ActivityChooserModel;
    .param p2, "x1"    # Lcom/actionbarsherlock/widget/ActivityChooserModel$1;

    .prologue
    .line 1044
    invoke-direct {p0, p1}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;-><init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    .line 1047
    const/4 v1, 0x0

    .line 1048
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/4 v8, 0x0

    .line 1050
    .local v8, "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    iget-object v11, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;
    invoke-static {v11}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$500(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;

    move-result-object v12

    monitor-enter v12

    .line 1051
    :try_start_9
    new-instance v9, Ljava/util/ArrayList;

    iget-object v11, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;
    invoke-static {v11}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$600(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_14
    .catchall {:try_start_9 .. :try_end_14} :catchall_7f

    .line 1052
    .end local v8    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .local v9, "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :try_start_14
    monitor-exit v12
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13b

    .line 1055
    :try_start_15
    iget-object v11, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mContext:Landroid/content/Context;
    invoke-static {v11}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$400(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;

    move-result-object v11

    iget-object v12, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v12}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;
    :try_end_25
    .catch Ljava/io/FileNotFoundException; {:try_start_15 .. :try_end_25} :catch_82

    move-result-object v1

    .line 1061
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v10

    .line 1064
    .local v10, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    const/4 v11, 0x0

    :try_start_2b
    invoke-interface {v10, v1, v11}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 1065
    const-string v11, "UTF-8"

    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1066
    const/4 v11, 0x0

    const-string v12, "historical-records"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1068
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v7

    .line 1069
    .local v7, "recordCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_43
    if-ge v2, v7, :cond_a4

    .line 1070
    const/4 v11, 0x0

    invoke-interface {v9, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;

    .line 1071
    .local v6, "record":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    const/4 v11, 0x0

    const-string v12, "historical-record"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1072
    const/4 v11, 0x0

    const-string v12, "activity"

    iget-object v13, v6, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;->activity:Landroid/content/ComponentName;

    invoke-virtual {v13}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v11, v12, v13}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1073
    const/4 v11, 0x0

    const-string v12, "time"

    iget-wide v13, v6, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;->time:J

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v11, v12, v13}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1074
    const/4 v11, 0x0

    const-string v12, "weight"

    iget v13, v6, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;->weight:F

    invoke-static {v13}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v11, v12, v13}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1075
    const/4 v11, 0x0

    const-string v12, "historical-record"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_7c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2b .. :try_end_7c} :catch_b5
    .catch Ljava/lang/IllegalStateException; {:try_start_2b .. :try_end_7c} :catch_de
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_7c} :catch_107
    .catchall {:try_start_2b .. :try_end_7c} :catchall_132

    .line 1069
    add-int/lit8 v2, v2, 0x1

    goto :goto_43

    .line 1052
    .end local v2    # "i":I
    .end local v6    # "record":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    .end local v7    # "recordCount":I
    .end local v9    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v10    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    .restart local v8    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :catchall_7f
    move-exception v11

    :goto_80
    :try_start_80
    monitor-exit v12
    :try_end_81
    .catchall {:try_start_80 .. :try_end_81} :catchall_7f

    throw v11

    .line 1056
    .end local v8    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v9    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :catch_82
    move-exception v0

    .line 1057
    .local v0, "fnfe":Ljava/io/FileNotFoundException;
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1102
    .end local v0    # "fnfe":Ljava/io/FileNotFoundException;
    :cond_a3
    :goto_a3
    return-void

    .line 1081
    .restart local v2    # "i":I
    .restart local v7    # "recordCount":I
    .restart local v10    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :cond_a4
    const/4 v11, 0x0

    :try_start_a5
    const-string v12, "historical-records"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1082
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_ad
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a5 .. :try_end_ad} :catch_b5
    .catch Ljava/lang/IllegalStateException; {:try_start_a5 .. :try_end_ad} :catch_de
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_ad} :catch_107
    .catchall {:try_start_a5 .. :try_end_ad} :catchall_132

    .line 1094
    if-eqz v1, :cond_a3

    .line 1096
    :try_start_af
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_b2
    .catch Ljava/io/IOException; {:try_start_af .. :try_end_b2} :catch_b3

    goto :goto_a3

    .line 1097
    :catch_b3
    move-exception v11

    goto :goto_a3

    .line 1087
    .end local v2    # "i":I
    .end local v7    # "recordCount":I
    :catch_b5
    move-exception v3

    .line 1088
    .local v3, "iae":Ljava/lang/IllegalArgumentException;
    :try_start_b6
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_d6
    .catchall {:try_start_b6 .. :try_end_d6} :catchall_132

    .line 1094
    if-eqz v1, :cond_a3

    .line 1096
    :try_start_d8
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_db
    .catch Ljava/io/IOException; {:try_start_d8 .. :try_end_db} :catch_dc

    goto :goto_a3

    .line 1097
    :catch_dc
    move-exception v11

    goto :goto_a3

    .line 1089
    .end local v3    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_de
    move-exception v5

    .line 1090
    .local v5, "ise":Ljava/lang/IllegalStateException;
    :try_start_df
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_ff
    .catchall {:try_start_df .. :try_end_ff} :catchall_132

    .line 1094
    if-eqz v1, :cond_a3

    .line 1096
    :try_start_101
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_104
    .catch Ljava/io/IOException; {:try_start_101 .. :try_end_104} :catch_105

    goto :goto_a3

    .line 1097
    :catch_105
    move-exception v11

    goto :goto_a3

    .line 1091
    .end local v5    # "ise":Ljava/lang/IllegalStateException;
    :catch_107
    move-exception v4

    .line 1092
    .local v4, "ioe":Ljava/io/IOException;
    :try_start_108
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_128
    .catchall {:try_start_108 .. :try_end_128} :catchall_132

    .line 1094
    if-eqz v1, :cond_a3

    .line 1096
    :try_start_12a
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_12d
    .catch Ljava/io/IOException; {:try_start_12a .. :try_end_12d} :catch_12f

    goto/16 :goto_a3

    .line 1097
    :catch_12f
    move-exception v11

    goto/16 :goto_a3

    .line 1094
    .end local v4    # "ioe":Ljava/io/IOException;
    :catchall_132
    move-exception v11

    if-eqz v1, :cond_138

    .line 1096
    :try_start_135
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_138
    .catch Ljava/io/IOException; {:try_start_135 .. :try_end_138} :catch_139

    .line 1099
    :cond_138
    :goto_138
    throw v11

    .line 1097
    :catch_139
    move-exception v12

    goto :goto_138

    .line 1052
    .end local v10    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catchall_13b
    move-exception v11

    move-object v8, v9

    .end local v9    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v8    # "records":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    goto/16 :goto_80
.end method
