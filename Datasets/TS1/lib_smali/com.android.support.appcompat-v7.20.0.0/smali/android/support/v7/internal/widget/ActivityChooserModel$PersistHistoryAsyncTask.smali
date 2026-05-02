.class final Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;
.super Landroid/os/AsyncTask;
.source "ActivityChooserModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/ActivityChooserModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PersistHistoryAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;


# direct methods
.method private constructor <init>(Landroid/support/v7/internal/widget/ActivityChooserModel;)V
    .registers 2

    .prologue
    .line 1049
    iput-object p1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/internal/widget/ActivityChooserModel;Landroid/support/v7/internal/widget/ActivityChooserModel$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/internal/widget/ActivityChooserModel;
    .param p2, "x1"    # Landroid/support/v7/internal/widget/ActivityChooserModel$1;

    .prologue
    .line 1049
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;-><init>(Landroid/support/v7/internal/widget/ActivityChooserModel;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 1049
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .registers 17
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1054
    const/4 v11, 0x0

    aget-object v2, p1, v11

    check-cast v2, Ljava/util/List;

    .line 1055
    .local v2, "historicalRecords":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;>;"
    const/4 v11, 0x1

    aget-object v3, p1, v11

    check-cast v3, Ljava/lang/String;

    .line 1057
    .local v3, "hostoryFileName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1060
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_b
    iget-object v11, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mContext:Landroid/content/Context;
    invoke-static {v11}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$200(Landroid/support/v7/internal/widget/ActivityChooserModel;)Landroid/content/Context;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v3, v12}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_15} :catch_6f

    move-result-object v1

    .line 1066
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v10

    .line 1069
    .local v10, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    const/4 v11, 0x0

    :try_start_1b
    invoke-interface {v10, v1, v11}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 1070
    const-string v11, "UTF-8"

    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1071
    const/4 v11, 0x0

    const-string v12, "historical-records"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1073
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v9

    .line 1074
    .local v9, "recordCount":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_33
    if-ge v4, v9, :cond_8c

    .line 1075
    const/4 v11, 0x0

    invoke-interface {v2, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    .line 1076
    .local v8, "record":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    const/4 v11, 0x0

    const-string v12, "historical-record"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1077
    const/4 v11, 0x0

    const-string v12, "activity"

    iget-object v13, v8, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;->activity:Landroid/content/ComponentName;

    invoke-virtual {v13}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v11, v12, v13}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1079
    const/4 v11, 0x0

    const-string v12, "time"

    iget-wide v13, v8, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;->time:J

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v11, v12, v13}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1080
    const/4 v11, 0x0

    const-string v12, "weight"

    iget v13, v8, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;->weight:F

    invoke-static {v13}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v11, v12, v13}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1081
    const/4 v11, 0x0

    const-string v12, "historical-record"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_6c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1b .. :try_end_6c} :catch_a2
    .catch Ljava/lang/IllegalStateException; {:try_start_1b .. :try_end_6c} :catch_d1
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_6c} :catch_100
    .catchall {:try_start_1b .. :try_end_6c} :catchall_131

    .line 1074
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 1061
    .end local v4    # "i":I
    .end local v8    # "record":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    .end local v9    # "recordCount":I
    .end local v10    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_6f
    move-exception v0

    .line 1062
    .local v0, "fnfe":Ljava/io/FileNotFoundException;
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1063
    const/4 v11, 0x0

    .line 1109
    .end local v0    # "fnfe":Ljava/io/FileNotFoundException;
    :goto_8b
    return-object v11

    .line 1087
    .restart local v4    # "i":I
    .restart local v9    # "recordCount":I
    .restart local v10    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :cond_8c
    const/4 v11, 0x0

    :try_start_8d
    const-string v12, "historical-records"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1088
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_95
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8d .. :try_end_95} :catch_a2
    .catch Ljava/lang/IllegalStateException; {:try_start_8d .. :try_end_95} :catch_d1
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_95} :catch_100
    .catchall {:try_start_8d .. :try_end_95} :catchall_131

    .line 1100
    iget-object v11, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v12, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v11, v12}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1101
    if-eqz v1, :cond_a0

    .line 1103
    :try_start_9d
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_a0
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_a0} :catch_13e

    .line 1109
    .end local v4    # "i":I
    .end local v9    # "recordCount":I
    :cond_a0
    :goto_a0
    const/4 v11, 0x0

    goto :goto_8b

    .line 1093
    :catch_a2
    move-exception v5

    .line 1094
    .local v5, "iae":Ljava/lang/IllegalArgumentException;
    :try_start_a3
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c3
    .catchall {:try_start_a3 .. :try_end_c3} :catchall_131

    .line 1100
    iget-object v11, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v12, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v11, v12}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1101
    if-eqz v1, :cond_a0

    .line 1103
    :try_start_cb
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_ce
    .catch Ljava/io/IOException; {:try_start_cb .. :try_end_ce} :catch_cf

    goto :goto_a0

    .line 1104
    :catch_cf
    move-exception v11

    goto :goto_a0

    .line 1095
    .end local v5    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_d1
    move-exception v7

    .line 1096
    .local v7, "ise":Ljava/lang/IllegalStateException;
    :try_start_d2
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_f2
    .catchall {:try_start_d2 .. :try_end_f2} :catchall_131

    .line 1100
    iget-object v11, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v12, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v11, v12}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1101
    if-eqz v1, :cond_a0

    .line 1103
    :try_start_fa
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_fd
    .catch Ljava/io/IOException; {:try_start_fa .. :try_end_fd} :catch_fe

    goto :goto_a0

    .line 1104
    :catch_fe
    move-exception v11

    goto :goto_a0

    .line 1097
    .end local v7    # "ise":Ljava/lang/IllegalStateException;
    :catch_100
    move-exception v6

    .line 1098
    .local v6, "ioe":Ljava/io/IOException;
    :try_start_101
    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$300()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error writing historical recrod file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    # getter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static {v13}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_121
    .catchall {:try_start_101 .. :try_end_121} :catchall_131

    .line 1100
    iget-object v11, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v12, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v11, v12}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1101
    if-eqz v1, :cond_a0

    .line 1103
    :try_start_129
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_12c
    .catch Ljava/io/IOException; {:try_start_129 .. :try_end_12c} :catch_12e

    goto/16 :goto_a0

    .line 1104
    :catch_12e
    move-exception v11

    goto/16 :goto_a0

    .line 1100
    .end local v6    # "ioe":Ljava/io/IOException;
    :catchall_131
    move-exception v11

    iget-object v12, p0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/internal/widget/ActivityChooserModel;

    const/4 v13, 0x1

    # setter for: Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z
    invoke-static {v12, v13}, Landroid/support/v7/internal/widget/ActivityChooserModel;->access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z

    .line 1101
    if-eqz v1, :cond_13d

    .line 1103
    :try_start_13a
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_13d
    .catch Ljava/io/IOException; {:try_start_13a .. :try_end_13d} :catch_141

    .line 1106
    :cond_13d
    :goto_13d
    throw v11

    .line 1104
    .restart local v4    # "i":I
    .restart local v9    # "recordCount":I
    :catch_13e
    move-exception v11

    goto/16 :goto_a0

    .end local v4    # "i":I
    .end local v9    # "recordCount":I
    :catch_141
    move-exception v12

    goto :goto_13d
.end method
