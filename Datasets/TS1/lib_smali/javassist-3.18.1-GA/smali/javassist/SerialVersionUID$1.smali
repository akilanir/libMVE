.class final Ljavassist/SerialVersionUID$1;
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
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 111
    move-object v0, p1

    check-cast v0, Ljavassist/CtField;

    .local v0, "field1":Ljavassist/CtField;
    move-object v1, p2

    .line 112
    check-cast v1, Ljavassist/CtField;

    .line 113
    .local v1, "field2":Ljavassist/CtField;
    invoke-virtual {v0}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    return v2
.end method
