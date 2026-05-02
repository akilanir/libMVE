.class Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;
.super Ljava/lang/Object;
.source "JCardReader.java"

# interfaces
.implements Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/json/JCardReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JCardDataStreamListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lezvcard/io/json/JCardReader;

.field private vcard:Lezvcard/VCard;

.field private versionFound:Z


# direct methods
.method private constructor <init>(Lezvcard/io/json/JCardReader;)V
    .registers 3

    .prologue
    .line 134
    iput-object p1, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->vcard:Lezvcard/VCard;

    .line 136
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->versionFound:Z

    return-void
.end method

.method synthetic constructor <init>(Lezvcard/io/json/JCardReader;Lezvcard/io/json/JCardReader$1;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/io/json/JCardReader;
    .param p2, "x1"    # Lezvcard/io/json/JCardReader$1;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;-><init>(Lezvcard/io/json/JCardReader;)V

    return-void
.end method

.method static synthetic access$100(Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;)Lezvcard/VCard;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;

    .prologue
    .line 134
    iget-object v0, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->vcard:Lezvcard/VCard;

    return-object v0
.end method

.method static synthetic access$200(Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;)Z
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;

    .prologue
    .line 134
    iget-boolean v0, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->versionFound:Z

    return v0
.end method


# virtual methods
.method public beginVCard()V
    .registers 3

    .prologue
    .line 139
    new-instance v0, Lezvcard/VCard;

    invoke-direct {v0}, Lezvcard/VCard;-><init>()V

    iput-object v0, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->vcard:Lezvcard/VCard;

    .line 140
    iget-object v0, p0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->vcard:Lezvcard/VCard;

    sget-object v1, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-virtual {v0, v1}, Lezvcard/VCard;->setVersion(Lezvcard/VCardVersion;)V

    .line 141
    return-void
.end method

.method public readProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V
    .registers 23
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p4, "dataType"    # Lezvcard/VCardDataType;
    .param p5, "value"    # Lezvcard/io/json/JCardValue;

    .prologue
    .line 144
    const-string v11, "version"

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3e

    .line 146
    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->versionFound:Z

    .line 148
    invoke-virtual/range {p5 .. p5}, Lezvcard/io/json/JCardValue;->asSingle()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lezvcard/VCardVersion;->valueOfByStr(Ljava/lang/String;)Lezvcard/VCardVersion;

    move-result-object v9

    .line 149
    .local v9, "version":Lezvcard/VCardVersion;
    sget-object v11, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-eq v9, v11, :cond_3d

    .line 150
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v11}, Lezvcard/io/json/JCardReader;->access$400(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;
    invoke-static {v12}, Lezvcard/io/json/JCardReader;->access$300(Lezvcard/io/json/JCardReader;)Lezvcard/io/json/JCardRawReader;

    move-result-object v12

    invoke-virtual {v12}, Lezvcard/io/json/JCardRawReader;->getLineNum()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x1e

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v0, v13, v14}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 184
    .end local v9    # "version":Lezvcard/VCardVersion;
    :cond_3d
    :goto_3d
    return-void

    .line 155
    :cond_3e
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->index:Lezvcard/io/scribe/ScribeIndex;
    invoke-static {v11}, Lezvcard/io/json/JCardReader;->access$500(Lezvcard/io/json/JCardReader;)Lezvcard/io/scribe/ScribeIndex;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/String;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v7

    .line 156
    .local v7, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    if-nez v7, :cond_55

    .line 157
    new-instance v7, Lezvcard/io/scribe/RawPropertyScribe;

    .end local v7    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    move-object/from16 v0, p2

    invoke-direct {v7, v0}, Lezvcard/io/scribe/RawPropertyScribe;-><init>(Ljava/lang/String;)V

    .line 162
    .restart local v7    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :cond_55
    :try_start_55
    move-object/from16 v0, p5

    move-object/from16 v1, p4

    move-object/from16 v2, p3

    invoke-virtual {v7, v0, v1, v2}, Lezvcard/io/scribe/VCardPropertyScribe;->parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v6

    .line 163
    .local v6, "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getWarnings()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_67
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_106

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 164
    .local v10, "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v11}, Lezvcard/io/json/JCardReader;->access$600(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;
    invoke-static {v12}, Lezvcard/io/json/JCardReader;->access$300(Lezvcard/io/json/JCardReader;)Lezvcard/io/json/JCardRawReader;

    move-result-object v12

    invoke-virtual {v12}, Lezvcard/io/json/JCardRawReader;->getLineNum()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v10, v0}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_90
    .catch Lezvcard/io/SkipMeException; {:try_start_55 .. :try_end_90} :catch_91
    .catch Lezvcard/io/CannotParseException; {:try_start_55 .. :try_end_90} :catch_bc
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_55 .. :try_end_90} :catch_118

    goto :goto_67

    .line 166
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v10    # "warning":Ljava/lang/String;
    :catch_91
    move-exception v3

    .line 167
    .local v3, "e":Lezvcard/io/SkipMeException;
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v11}, Lezvcard/io/json/JCardReader;->access$700(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;
    invoke-static {v12}, Lezvcard/io/json/JCardReader;->access$300(Lezvcard/io/json/JCardReader;)Lezvcard/io/json/JCardRawReader;

    move-result-object v12

    invoke-virtual {v12}, Lezvcard/io/json/JCardRawReader;->getLineNum()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x16

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v3}, Lezvcard/io/SkipMeException;->getMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v0, v13, v14}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_3d

    .line 169
    .end local v3    # "e":Lezvcard/io/SkipMeException;
    :catch_bc
    move-exception v3

    .line 170
    .local v3, "e":Lezvcard/io/CannotParseException;
    new-instance v7, Lezvcard/io/scribe/RawPropertyScribe;

    .end local v7    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    move-object/from16 v0, p2

    invoke-direct {v7, v0}, Lezvcard/io/scribe/RawPropertyScribe;-><init>(Ljava/lang/String;)V

    .line 171
    .restart local v7    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    move-object/from16 v0, p5

    move-object/from16 v1, p4

    move-object/from16 v2, p3

    invoke-virtual {v7, v0, v1, v2}, Lezvcard/io/scribe/VCardPropertyScribe;->parseJson(Lezvcard/io/json/JCardValue;Lezvcard/VCardDataType;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v6

    .line 173
    .restart local v6    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v5

    .line 174
    .local v5, "property":Lezvcard/property/VCardProperty;
    check-cast v5, Lezvcard/property/RawProperty;

    .end local v5    # "property":Lezvcard/property/VCardProperty;
    invoke-virtual {v5}, Lezvcard/property/RawProperty;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 175
    .local v8, "valueStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v11}, Lezvcard/io/json/JCardReader;->access$800(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;
    invoke-static {v12}, Lezvcard/io/json/JCardReader;->access$300(Lezvcard/io/json/JCardReader;)Lezvcard/io/json/JCardRawReader;

    move-result-object v12

    invoke-virtual {v12}, Lezvcard/io/json/JCardRawReader;->getLineNum()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x19

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v8, v14, v15

    const/4 v15, 0x1

    invoke-virtual {v3}, Lezvcard/io/CannotParseException;->getMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v0, v13, v14}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 181
    .end local v3    # "e":Lezvcard/io/CannotParseException;
    .end local v8    # "valueStr":Ljava/lang/String;
    :cond_106
    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v5

    .line 182
    .restart local v5    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 183
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->vcard:Lezvcard/VCard;

    invoke-virtual {v11, v5}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto/16 :goto_3d

    .line 176
    .end local v5    # "property":Lezvcard/property/VCardProperty;
    .end local v6    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :catch_118
    move-exception v3

    .line 177
    .local v3, "e":Lezvcard/io/EmbeddedVCardException;
    move-object/from16 v0, p0

    iget-object v11, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v11}, Lezvcard/io/json/JCardReader;->access$900(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->this$0:Lezvcard/io/json/JCardReader;

    # getter for: Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;
    invoke-static {v12}, Lezvcard/io/json/JCardReader;->access$300(Lezvcard/io/json/JCardReader;)Lezvcard/io/json/JCardRawReader;

    move-result-object v12

    invoke-virtual {v12}, Lezvcard/io/json/JCardRawReader;->getLineNum()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x1f

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v0, v13, v14}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto/16 :goto_3d
.end method
