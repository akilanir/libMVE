.class Lfreemarker/template/utility/Collections12$SingletonList;
.super Ljava/util/AbstractList;
.source "Collections12.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/Collections12;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonList"
.end annotation


# instance fields
.field private final element:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 259
    iput-object p1, p0, Lfreemarker/template/utility/Collections12$SingletonList;->element:Ljava/lang/Object;

    .line 260
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 269
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonList;->element:Ljava/lang/Object;

    invoke-static {p1, v0}, Lfreemarker/template/utility/Collections12;->access$100(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(I)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 274
    if-eqz p1, :cond_21

    .line 275
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ", Size: 1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_21
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonList;->element:Ljava/lang/Object;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 264
    const/4 v0, 0x1

    return v0
.end method
