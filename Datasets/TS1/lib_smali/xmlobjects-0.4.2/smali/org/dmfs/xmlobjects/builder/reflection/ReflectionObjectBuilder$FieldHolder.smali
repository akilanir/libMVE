.class final Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FieldHolder"
.end annotation


# instance fields
.field public final field:Ljava/lang/reflect/Field;

.field public final name:Lorg/dmfs/xmlobjects/QualifiedName;


# direct methods
.method public constructor <init>(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/reflect/Field;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->name:Lorg/dmfs/xmlobjects/QualifiedName;

    iput-object p2, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->field:Ljava/lang/reflect/Field;

    return-void
.end method
