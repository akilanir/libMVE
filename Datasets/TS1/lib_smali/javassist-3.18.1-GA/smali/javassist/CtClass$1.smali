.class Ljavassist/CtClass$1;
.super Ljavassist/ClassMap;
.source "CtClass.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/CtClass;->getRefClasses()Ljava/util/Collection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/CtClass;


# direct methods
.method constructor <init>(Ljavassist/CtClass;)V
    .registers 2

    .prologue
    .line 518
    iput-object p1, p0, Ljavassist/CtClass$1;->this$0:Ljavassist/CtClass;

    invoke-direct {p0}, Ljavassist/ClassMap;-><init>()V

    return-void
.end method


# virtual methods
.method public fix(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 529
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "jvmClassName"    # Ljava/lang/Object;

    .prologue
    .line 524
    check-cast p1, Ljava/lang/String;

    .end local p1    # "jvmClassName":Ljava/lang/Object;
    invoke-static {p1}, Ljavassist/CtClass$1;->toJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 525
    .local v0, "n":Ljava/lang/String;
    invoke-virtual {p0, v0, v0}, Ljavassist/CtClass$1;->put0(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 526
    const/4 v1, 0x0

    return-object v1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 520
    invoke-virtual {p0, p1, p2}, Ljavassist/CtClass$1;->put0(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 521
    return-void
.end method
