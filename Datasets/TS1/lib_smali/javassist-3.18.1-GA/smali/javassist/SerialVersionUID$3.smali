.class final Ljavassist/SerialVersionUID$3;
.super Ljava/lang/Object;
.source "SerialVersionUID.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/SerialVersionUID;->calculateDefault(Ljavassist/CtClass;)J
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 8
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 160
    move-object v0, p1

    check-cast v0, Ljavassist/CtMethod;

    .local v0, "m1":Ljavassist/CtMethod;
    move-object v1, p2

    .line 161
    check-cast v1, Ljavassist/CtMethod;

    .line 162
    .local v1, "m2":Ljavassist/CtMethod;
    invoke-virtual {v0}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    .line 163
    .local v2, "value":I
    if-nez v2, :cond_28

    .line 164
    invoke-virtual {v0}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    .line 167
    :cond_28
    return v2
.end method
