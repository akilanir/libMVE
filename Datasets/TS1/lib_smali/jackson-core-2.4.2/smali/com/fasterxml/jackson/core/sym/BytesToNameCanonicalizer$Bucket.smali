.class final Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;
.super Ljava/lang/Object;
.source "BytesToNameCanonicalizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Bucket"
.end annotation


# instance fields
.field private final hash:I

.field private final length:I

.field protected final name:Lcom/fasterxml/jackson/core/sym/Name;

.field protected final next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;


# direct methods
.method constructor <init>(Lcom/fasterxml/jackson/core/sym/Name;Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;)V
    .registers 4
    .param p1, "name"    # Lcom/fasterxml/jackson/core/sym/Name;
    .param p2, "next"    # Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    .prologue
    .line 1201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1202
    iput-object p1, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1203
    iput-object p2, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    .line 1204
    if-nez p2, :cond_13

    const/4 v0, 0x1

    :goto_a
    iput v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->length:I

    .line 1205
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/sym/Name;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->hash:I

    .line 1206
    return-void

    .line 1204
    :cond_13
    iget v0, p2, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->length:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method

.method static synthetic access$000(Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;)I
    .registers 2
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    .prologue
    .line 1194
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->length:I

    return v0
.end method


# virtual methods
.method public find(III)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 7
    .param p1, "h"    # I
    .param p2, "firstQuad"    # I
    .param p3, "secondQuad"    # I

    .prologue
    .line 1209
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->hash:I

    if-ne v2, p1, :cond_f

    .line 1210
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    invoke-virtual {v2, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals(II)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1211
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1222
    :cond_e
    :goto_e
    return-object v1

    .line 1214
    :cond_f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    .local v0, "curr":Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;
    :goto_11
    if-eqz v0, :cond_22

    .line 1215
    iget v2, v0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->hash:I

    if-ne v2, p1, :cond_1f

    .line 1216
    iget-object v1, v0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1217
    .local v1, "currName":Lcom/fasterxml/jackson/core/sym/Name;
    invoke-virtual {v1, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals(II)Z

    move-result v2

    if-nez v2, :cond_e

    .line 1214
    .end local v1    # "currName":Lcom/fasterxml/jackson/core/sym/Name;
    :cond_1f
    iget-object v0, v0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    goto :goto_11

    .line 1222
    :cond_22
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public find(I[II)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 7
    .param p1, "h"    # I
    .param p2, "quads"    # [I
    .param p3, "qlen"    # I

    .prologue
    .line 1226
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->hash:I

    if-ne v2, p1, :cond_f

    .line 1227
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    invoke-virtual {v2, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals([II)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1228
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1239
    :cond_e
    :goto_e
    return-object v1

    .line 1231
    :cond_f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    .local v0, "curr":Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;
    :goto_11
    if-eqz v0, :cond_22

    .line 1232
    iget v2, v0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->hash:I

    if-ne v2, p1, :cond_1f

    .line 1233
    iget-object v1, v0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1234
    .local v1, "currName":Lcom/fasterxml/jackson/core/sym/Name;
    invoke-virtual {v1, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals([II)Z

    move-result v2

    if-nez v2, :cond_e

    .line 1231
    .end local v1    # "currName":Lcom/fasterxml/jackson/core/sym/Name;
    :cond_1f
    iget-object v0, v0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    goto :goto_11

    .line 1239
    :cond_22
    const/4 v1, 0x0

    goto :goto_e
.end method
