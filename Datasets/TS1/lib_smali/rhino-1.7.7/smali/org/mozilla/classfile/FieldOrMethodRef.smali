.class final Lorg/mozilla/classfile/FieldOrMethodRef;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# instance fields
.field private className:Ljava/lang/String;

.field private hashCode:I

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 4743
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4789
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->hashCode:I

    .line 4744
    iput-object p1, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    .line 4745
    iput-object p2, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    .line 4746
    iput-object p3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    .line 4747
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 4767
    instance-of v2, p1, Lorg/mozilla/classfile/FieldOrMethodRef;

    if-nez v2, :cond_6

    .line 4769
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 4768
    check-cast v0, Lorg/mozilla/classfile/FieldOrMethodRef;

    .line 4769
    .local v0, "x":Lorg/mozilla/classfile/FieldOrMethodRef;
    iget-object v2, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    iget-object v3, v0, Lorg/mozilla/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    iget-object v3, v0, Lorg/mozilla/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    iget-object v3, v0, Lorg/mozilla/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 4751
    iget-object v0, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 4756
    iget-object v0, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 4761
    iget-object v0, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    .line 4777
    iget v3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->hashCode:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1c

    .line 4778
    iget-object v3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 4779
    .local v0, "h1":I
    iget-object v3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 4780
    .local v1, "h2":I
    iget-object v3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    .line 4781
    .local v2, "h3":I
    xor-int v3, v0, v1

    xor-int/2addr v3, v2

    iput v3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->hashCode:I

    .line 4783
    .end local v0    # "h1":I
    .end local v1    # "h2":I
    .end local v2    # "h3":I
    :cond_1c
    iget v3, p0, Lorg/mozilla/classfile/FieldOrMethodRef;->hashCode:I

    return v3
.end method
