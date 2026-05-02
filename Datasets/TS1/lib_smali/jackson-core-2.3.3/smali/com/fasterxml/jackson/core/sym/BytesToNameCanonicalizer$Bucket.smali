.class final Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;
.super Ljava/lang/Object;
.source "BytesToNameCanonicalizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Bucket"
.end annotation


# instance fields
.field private final _length:I

.field protected final _name:Lcom/fasterxml/jackson/core/sym/Name;

.field protected final _next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;


# direct methods
.method constructor <init>(Lcom/fasterxml/jackson/core/sym/Name;Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;)V
    .registers 4

    .prologue
    .line 1155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1156
    iput-object p1, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1157
    iput-object p2, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    .line 1158
    if-nez p2, :cond_d

    const/4 v0, 0x1

    :goto_a
    iput v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_length:I

    .line 1159
    return-void

    .line 1158
    :cond_d
    iget v0, p2, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_length:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method


# virtual methods
.method public find(III)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 7

    .prologue
    .line 1165
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/Name;->hashCode()I

    move-result v0

    if-ne v0, p1, :cond_13

    .line 1166
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    invoke-virtual {v0, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals(II)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1167
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1178
    :cond_12
    :goto_12
    return-object v0

    .line 1170
    :cond_13
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    move-object v1, v0

    :goto_16
    if-eqz v1, :cond_2a

    .line 1171
    iget-object v0, v1, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1172
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/Name;->hashCode()I

    move-result v2

    if-ne v2, p1, :cond_26

    .line 1173
    invoke-virtual {v0, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals(II)Z

    move-result v2

    if-nez v2, :cond_12

    .line 1170
    :cond_26
    iget-object v0, v1, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    move-object v1, v0

    goto :goto_16

    .line 1178
    :cond_2a
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public find(I[II)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 7

    .prologue
    .line 1183
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/Name;->hashCode()I

    move-result v0

    if-ne v0, p1, :cond_13

    .line 1184
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    invoke-virtual {v0, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals([II)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1185
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1196
    :cond_12
    :goto_12
    return-object v0

    .line 1188
    :cond_13
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    move-object v1, v0

    :goto_16
    if-eqz v1, :cond_2a

    .line 1189
    iget-object v0, v1, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_name:Lcom/fasterxml/jackson/core/sym/Name;

    .line 1190
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/Name;->hashCode()I

    move-result v2

    if-ne v2, p1, :cond_26

    .line 1191
    invoke-virtual {v0, p2, p3}, Lcom/fasterxml/jackson/core/sym/Name;->equals([II)Z

    move-result v2

    if-nez v2, :cond_12

    .line 1188
    :cond_26
    iget-object v0, v1, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_next:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;

    move-object v1, v0

    goto :goto_16

    .line 1196
    :cond_2a
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public length()I
    .registers 2

    .prologue
    .line 1161
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer$Bucket;->_length:I

    return v0
.end method
