.class public Lkorex/activation/ActivationDataFlavor;
.super Lkore/awt/datatransfer/DataFlavor;
.source "ActivationDataFlavor.java"


# instance fields
.field private humanPresentableName:Ljava/lang/String;

.field private mimeObject:Lkorex/activation/MimeType;

.field private mimeType:Ljava/lang/String;

.field private representationClass:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 4
    .param p1, "representationClass"    # Ljava/lang/Class;
    .param p2, "humanPresentableName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 109
    invoke-direct {p0, p1, p2}, Lkore/awt/datatransfer/DataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 58
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    .line 59
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeObject:Lkorex/activation/MimeType;

    .line 60
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 61
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    .line 110
    invoke-super {p0}, Lkore/awt/datatransfer/DataFlavor;->getMimeType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    .line 111
    iput-object p1, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    .line 112
    iput-object p2, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "representationClass"    # Ljava/lang/Class;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "humanPresentableName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 82
    invoke-direct {p0, p2, p3}, Lkore/awt/datatransfer/DataFlavor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    .line 59
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeObject:Lkorex/activation/MimeType;

    .line 60
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 61
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    .line 85
    iput-object p2, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    .line 86
    iput-object p3, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 87
    iput-object p1, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "humanPresentableName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 131
    invoke-direct {p0, p1, p2}, Lkore/awt/datatransfer/DataFlavor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    .line 59
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeObject:Lkorex/activation/MimeType;

    .line 60
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 61
    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    .line 132
    iput-object p1, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    .line 134
    :try_start_e
    const-string v0, "java.io.InputStream"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;
    :try_end_16
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_16} :catch_19

    .line 138
    :goto_16
    iput-object p2, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 139
    return-void

    .line 135
    :catch_19
    move-exception v0

    goto :goto_16
.end method


# virtual methods
.method public equals(Lkore/awt/datatransfer/DataFlavor;)Z
    .registers 4
    .param p1, "dataFlavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 186
    invoke-virtual {p0, p1}, Lkorex/activation/ActivationDataFlavor;->isMimeTypeEqual(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 187
    invoke-virtual {p1}, Lkore/awt/datatransfer/DataFlavor;->getRepresentationClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getHumanPresentableName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getRepresentationClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lkorex/activation/ActivationDataFlavor;->representationClass:Ljava/lang/Class;

    return-object v0
.end method

.method public isMimeTypeEqual(Ljava/lang/String;)Z
    .registers 6
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 203
    const/4 v0, 0x0

    .line 205
    .local v0, "mt":Lkorex/activation/MimeType;
    :try_start_1
    iget-object v2, p0, Lkorex/activation/ActivationDataFlavor;->mimeObject:Lkorex/activation/MimeType;

    if-nez v2, :cond_e

    .line 206
    new-instance v2, Lkorex/activation/MimeType;

    iget-object v3, p0, Lkorex/activation/ActivationDataFlavor;->mimeType:Ljava/lang/String;

    invoke-direct {v2, v3}, Lkorex/activation/MimeType;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lkorex/activation/ActivationDataFlavor;->mimeObject:Lkorex/activation/MimeType;

    .line 207
    :cond_e
    new-instance v1, Lkorex/activation/MimeType;

    invoke-direct {v1, p1}, Lkorex/activation/MimeType;-><init>(Ljava/lang/String;)V
    :try_end_13
    .catch Lkorex/activation/MimeTypeParseException; {:try_start_1 .. :try_end_13} :catch_1b

    .end local v0    # "mt":Lkorex/activation/MimeType;
    .local v1, "mt":Lkorex/activation/MimeType;
    move-object v0, v1

    .line 210
    .end local v1    # "mt":Lkorex/activation/MimeType;
    .restart local v0    # "mt":Lkorex/activation/MimeType;
    :goto_14
    iget-object v2, p0, Lkorex/activation/ActivationDataFlavor;->mimeObject:Lkorex/activation/MimeType;

    invoke-virtual {v2, v0}, Lkorex/activation/MimeType;->match(Lkorex/activation/MimeType;)Z

    move-result v2

    return v2

    .line 208
    :catch_1b
    move-exception v2

    goto :goto_14
.end method

.method protected normalizeMimeType(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 246
    return-object p1
.end method

.method protected normalizeMimeTypeParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "parameterName"    # Ljava/lang/String;
    .param p2, "parameterValue"    # Ljava/lang/String;

    .prologue
    .line 230
    return-object p2
.end method

.method public setHumanPresentableName(Ljava/lang/String;)V
    .registers 2
    .param p1, "humanPresentableName"    # Ljava/lang/String;

    .prologue
    .line 174
    iput-object p1, p0, Lkorex/activation/ActivationDataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 175
    return-void
.end method
