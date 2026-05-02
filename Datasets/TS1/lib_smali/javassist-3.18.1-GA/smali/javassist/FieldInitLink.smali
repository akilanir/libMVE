.class Ljavassist/FieldInitLink;
.super Ljava/lang/Object;
.source "CtClassType.java"


# instance fields
.field field:Ljavassist/CtField;

.field init:Ljavassist/CtField$Initializer;

.field next:Ljavassist/FieldInitLink;


# direct methods
.method constructor <init>(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V
    .registers 4
    .param p1, "f"    # Ljavassist/CtField;
    .param p2, "i"    # Ljavassist/CtField$Initializer;

    .prologue
    .line 1717
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1718
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/FieldInitLink;->next:Ljavassist/FieldInitLink;

    .line 1719
    iput-object p1, p0, Ljavassist/FieldInitLink;->field:Ljavassist/CtField;

    .line 1720
    iput-object p2, p0, Ljavassist/FieldInitLink;->init:Ljavassist/CtField$Initializer;

    .line 1721
    return-void
.end method
