.class public Ljavassist/tools/reflect/Sample;
.super Ljava/lang/Object;
.source "Sample.java"


# static fields
.field private static _classobject:Ljavassist/tools/reflect/ClassMetaobject;


# instance fields
.field private _metaobject:Ljavassist/tools/reflect/Metaobject;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static trapRead([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 42
    aget-object v0, p0, v1

    if-nez v0, :cond_c

    .line 43
    sget-object v0, Ljavassist/tools/reflect/Sample;->_classobject:Ljavassist/tools/reflect/ClassMetaobject;

    invoke-virtual {v0, p1}, Ljavassist/tools/reflect/ClassMetaobject;->trapFieldRead(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 45
    :goto_b
    return-object v0

    :cond_c
    aget-object v0, p0, v1

    check-cast v0, Ljavassist/tools/reflect/Metalevel;

    invoke-interface {v0}, Ljavassist/tools/reflect/Metalevel;->_getMetaobject()Ljavassist/tools/reflect/Metaobject;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavassist/tools/reflect/Metaobject;->trapFieldRead(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_b
.end method

.method public static trapStatic([Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 3
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "identifier"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 38
    sget-object v0, Ljavassist/tools/reflect/Sample;->_classobject:Ljavassist/tools/reflect/ClassMetaobject;

    invoke-virtual {v0, p1, p0}, Ljavassist/tools/reflect/ClassMetaobject;->trapMethodcall(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static trapWrite([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 49
    const/4 v1, 0x0

    aget-object v0, p0, v1

    check-cast v0, Ljavassist/tools/reflect/Metalevel;

    .line 50
    .local v0, "base":Ljavassist/tools/reflect/Metalevel;
    if-nez v0, :cond_11

    .line 51
    sget-object v1, Ljavassist/tools/reflect/Sample;->_classobject:Ljavassist/tools/reflect/ClassMetaobject;

    aget-object v2, p0, v2

    invoke-virtual {v1, p1, v2}, Ljavassist/tools/reflect/ClassMetaobject;->trapFieldWrite(Ljava/lang/String;Ljava/lang/Object;)V

    .line 55
    :goto_f
    const/4 v1, 0x0

    return-object v1

    .line 53
    :cond_11
    invoke-interface {v0}, Ljavassist/tools/reflect/Metalevel;->_getMetaobject()Ljavassist/tools/reflect/Metaobject;

    move-result-object v1

    aget-object v2, p0, v2

    invoke-virtual {v1, p1, v2}, Ljavassist/tools/reflect/Metaobject;->trapFieldWrite(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_f
.end method


# virtual methods
.method public trap([Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 5
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "identifier"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 28
    iget-object v0, p0, Ljavassist/tools/reflect/Sample;->_metaobject:Ljavassist/tools/reflect/Metaobject;

    .line 29
    .local v0, "mobj":Ljavassist/tools/reflect/Metaobject;
    if-nez v0, :cond_9

    .line 30
    invoke-static {p0, p2, p1}, Ljavassist/tools/reflect/ClassMetaobject;->invoke(Ljava/lang/Object;I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 32
    :goto_8
    return-object v1

    :cond_9
    invoke-virtual {v0, p2, p1}, Ljavassist/tools/reflect/Metaobject;->trapMethodcall(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_8
.end method
