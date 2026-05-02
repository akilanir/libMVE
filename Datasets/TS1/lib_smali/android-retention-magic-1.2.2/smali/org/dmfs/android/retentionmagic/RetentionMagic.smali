.class public final Lorg/dmfs/android/retentionmagic/RetentionMagic;
.super Ljava/lang/Object;
.source "RetentionMagic.java"


# static fields
.field private static final ARRAYLIST_FINAL_CLASS_HELPERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;"
        }
    .end annotation
.end field

.field private static final ARRAYLIST_OTHER_CLASS_HELPERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;"
        }
    .end annotation
.end field

.field private static final CLASS_CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Field;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final FINAL_CLASS_HELPERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;"
        }
    .end annotation
.end field

.field private static final OTHER_CLASS_HELPERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/16 v3, 0x8

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_FINAL_CLASS_HELPERS:Ljava/util/Map;

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_OTHER_CLASS_HELPERS:Ljava/util/Map;

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->CLASS_CACHE:Ljava/util/Map;

    .line 96
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$1;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$1;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [Z

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$2;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$2;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$3;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$3;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [B

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$4;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$4;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$5;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$5;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [S

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$6;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$6;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$7;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$7;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [C

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$8;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$8;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$9;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$9;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [I

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$10;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$10;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$11;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$11;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [J

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$12;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$12;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$13;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$13;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [F

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$14;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$14;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$15;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$15;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [D

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$16;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$16;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Ljava/lang/String;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$17;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$17;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [Ljava/lang/String;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$18;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$18;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Landroid/os/Bundle;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$19;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$19;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Landroid/util/SparseArray;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$20;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$20;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Ljava/lang/Integer;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$21;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$21;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_FINAL_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Ljava/lang/String;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$22;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$22;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_13d

    .line 669
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Ljava/lang/CharSequence;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$23;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$23;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 690
    :cond_13d
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Landroid/os/Parcelable;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$24;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$24;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Ljava/lang/CharSequence;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$25;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$25;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_165

    .line 728
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [Ljava/lang/CharSequence;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$26;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$26;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    :cond_165
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Landroid/os/Parcelable;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$27;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$27;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 765
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, [Landroid/os/Parcelable;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$28;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$28;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 782
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Ljava/io/Serializable;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$29;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$29;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_19b

    .line 803
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    const-class v1, Landroid/os/IBinder;

    new-instance v2, Lorg/dmfs/android/retentionmagic/RetentionMagic$30;

    invoke-direct {v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic$30;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 822
    :cond_19b
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 828
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 830
    return-void
.end method

.method private static getArrayListHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;"
        }
    .end annotation

    .prologue
    .line 1458
    .local p0, "genericArrayListType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Lorg/dmfs/android/retentionmagic/RetentionMagic;->ARRAYLIST_OTHER_CLASS_HELPERS:Ljava/util/Map;

    invoke-static {p0, v0, v1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getHelper(Ljava/lang/Class;Ljava/util/Map;Ljava/util/Map;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v0

    return-object v0
.end method

.method private static getHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;"
        }
    .end annotation

    .prologue
    .line 1452
    .local p0, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/dmfs/android/retentionmagic/RetentionMagic;->FINAL_CLASS_HELPERS:Ljava/util/Map;

    sget-object v1, Lorg/dmfs/android/retentionmagic/RetentionMagic;->OTHER_CLASS_HELPERS:Ljava/util/Map;

    invoke-static {p0, v0, v1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getHelper(Ljava/lang/Class;Ljava/util/Map;Ljava/util/Map;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v0

    return-object v0
.end method

.method private static getHelper(Ljava/lang/Class;Ljava/util/Map;Ljava/util/Map;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;",
            ">;)",
            "Lorg/dmfs/android/retentionmagic/PersistenceHelper;"
        }
    .end annotation

    .prologue
    .line 1465
    .local p0, "genericType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "finalClassHelper":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    .local p2, "otherClassHelper":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    .line 1466
    .local v1, "result":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v1, :cond_9

    .line 1478
    .end local v1    # "result":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    :goto_8
    return-object v1

    .line 1471
    .restart local v1    # "result":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    :cond_9
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_19

    .line 1478
    const/4 v1, 0x0

    goto :goto_8

    .line 1471
    :cond_19
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 1473
    .local v0, "classClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 1475
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-object v1, v2

    goto :goto_8
.end method

.method private static getTag(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    .registers 11
    .param p1, "instanceTag"    # Ljava/lang/String;
    .param p2, "classTag"    # Ljava/lang/String;
    .param p3, "instance"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/StringBuilder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .local p0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v6, 0x2e

    const/4 v5, 0x1

    .line 1484
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v4, 0x100

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1486
    .local v1, "result":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_37

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_37

    .line 1488
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v4, v5, :cond_63

    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_63

    .line 1492
    :try_start_1f
    const-string v4, "TAG"

    invoke-virtual {p0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 1493
    .local v2, "tagField":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1494
    invoke-virtual {v2, p3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_34} :catch_5a

    .line 1505
    .end local v2    # "tagField":Ljava/lang/reflect/Field;
    :goto_34
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1508
    :cond_37
    if-eqz p1, :cond_59

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_59

    .line 1512
    :try_start_3f
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 1513
    .restart local v2    # "tagField":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1514
    invoke-virtual {v2, p3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 1515
    .local v3, "value":Ljava/lang/Object;
    if-eqz v3, :cond_59

    .line 1517
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1518
    const/16 v4, 0x2e

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_59
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3f .. :try_end_59} :catch_69
    .catch Ljava/lang/SecurityException; {:try_start_3f .. :try_end_59} :catch_67

    .line 1531
    .end local v2    # "tagField":Ljava/lang/reflect/Field;
    .end local v3    # "value":Ljava/lang/Object;
    :cond_59
    :goto_59
    return-object v1

    .line 1496
    :catch_5a
    move-exception v0

    .line 1498
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 1503
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_63
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 1525
    :catch_67
    move-exception v4

    goto :goto_59

    .line 1521
    :catch_69
    move-exception v4

    goto :goto_59
.end method

.method public static init(Landroid/app/Activity;Landroid/content/SharedPreferences;)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 1088
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1094
    :goto_7
    return-void

    .line 1090
    :catch_8
    move-exception v0

    .line 1092
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static init(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 1127
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1133
    :goto_7
    return-void

    .line 1129
    :catch_8
    move-exception v0

    .line 1131
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static init(Landroid/app/Fragment;Landroid/content/SharedPreferences;)V
    .registers 4
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 1101
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1107
    :goto_7
    return-void

    .line 1103
    :catch_8
    move-exception v0

    .line 1105
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static init(Landroid/app/Fragment;Landroid/os/Bundle;)V
    .registers 4
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "arguments"    # Landroid/os/Bundle;

    .prologue
    .line 1140
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1146
    :goto_7
    return-void

    .line 1142
    :catch_8
    move-exception v0

    .line 1144
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static init(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences;)V
    .registers 4
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 1114
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1120
    :goto_7
    return-void

    .line 1116
    :catch_8
    move-exception v0

    .line 1118
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static init(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .registers 4
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "arguments"    # Landroid/os/Bundle;

    .prologue
    .line 1153
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1159
    :goto_7
    return-void

    .line 1155
    :catch_8
    move-exception v0

    .line 1157
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method private static init(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences;)V
    .registers 14
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "prefs"    # Landroid/content/SharedPreferences;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "Landroid/content/SharedPreferences;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 1260
    .local p0, "classInstance":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v6, Lorg/dmfs/android/retentionmagic/RetentionMagic;->CLASS_CACHE:Ljava/util/Map;

    invoke-interface {v6, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 1262
    .local v3, "helperCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    if-nez v3, :cond_97

    .line 1264
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    array-length v8, v7

    const/4 v6, 0x0

    :goto_10
    if-lt v6, v8, :cond_13

    .line 1317
    :cond_12
    return-void

    .line 1264
    :cond_13
    aget-object v1, v7, v6

    .line 1266
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v9, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    invoke-virtual {v1, v9}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    .line 1267
    .local v5, "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    if-eqz v5, :cond_8d

    const-class v9, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-nez v9, :cond_8d

    .line 1269
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->permanent()Z

    move-result v9

    if-nez v9, :cond_34

    .line 1264
    :cond_31
    :goto_31
    add-int/lit8 v6, v6, 0x1

    goto :goto_10

    .line 1274
    :cond_34
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1276
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->key()Ljava/lang/String;

    move-result-object v4

    .line 1277
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->instanceNSField()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->classNS()Ljava/lang/String;

    move-result-object v10

    invoke-static {p0, v9, v10, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getTag(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 1278
    if-eqz v4, :cond_50

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_54

    :cond_50
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1277
    .end local v4    # "key":Ljava/lang/String;
    :cond_54
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 1278
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1280
    .restart local v4    # "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v2

    .line 1281
    .local v2, "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v2, :cond_6a

    .line 1283
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    goto :goto_31

    .line 1287
    :cond_6a
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "field of class "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not supported for permanent storage"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1290
    .end local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v4    # "key":Ljava/lang/String;
    :cond_8d
    if-eqz v5, :cond_31

    .line 1292
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    const-string v7, "@Retain does not support ArrayLists, use @RetainArrayList instead"

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1298
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    :cond_97
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_9f
    :goto_9f
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_12

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1300
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    .line 1301
    .restart local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 1302
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    if-eqz v2, :cond_9f

    .line 1304
    const-class v7, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    .line 1305
    .restart local v5    # "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    if-eqz v5, :cond_9f

    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->permanent()Z

    move-result v7

    if-eqz v7, :cond_9f

    .line 1309
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->key()Ljava/lang/String;

    move-result-object v4

    .line 1310
    .restart local v4    # "key":Ljava/lang/String;
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->instanceNSField()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->classNS()Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v7, v8, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getTag(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1311
    if-eqz v4, :cond_e1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_e5

    :cond_e1
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1310
    .end local v4    # "key":Ljava/lang/String;
    :cond_e5
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1311
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1313
    .restart local v4    # "key":Ljava/lang/String;
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    goto :goto_9f
.end method

.method private static init(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;)V
    .registers 14
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .local p0, "classInstance":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v10, 0x1

    .line 1385
    if-eqz p2, :cond_9

    invoke-virtual {p2}, Landroid/os/Bundle;->size()I

    move-result v5

    if-nez v5, :cond_a

    .line 1447
    :cond_9
    return-void

    .line 1390
    :cond_a
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_10
    if-ge v5, v7, :cond_9

    aget-object v0, v6, v5

    .line 1392
    .local v0, "field":Ljava/lang/reflect/Field;
    const-class v8, Lorg/dmfs/android/retentionmagic/annotations/Parameter;

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    check-cast v3, Lorg/dmfs/android/retentionmagic/annotations/Parameter;

    .line 1393
    .local v3, "param":Lorg/dmfs/android/retentionmagic/annotations/Parameter;
    if-eqz v3, :cond_70

    const-class v8, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_70

    .line 1395
    invoke-virtual {v0, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1397
    invoke-interface {v3}, Lorg/dmfs/android/retentionmagic/annotations/Parameter;->key()Ljava/lang/String;

    move-result-object v2

    .line 1398
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_39

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_3d

    .line 1400
    :cond_39
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1403
    :cond_3d
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v1

    .line 1404
    .local v1, "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v1, :cond_4d

    .line 1406
    invoke-virtual {v1, v0, p1, v2, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 1390
    .end local v1    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v2    # "key":Ljava/lang/String;
    :cond_4a
    :goto_4a
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    .line 1410
    .restart local v1    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .restart local v2    # "key":Ljava/lang/String;
    :cond_4d
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "field of class "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 1411
    const-string v7, " not supported for initialization from a Bundle"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1410
    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1414
    .end local v1    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v2    # "key":Ljava/lang/String;
    :cond_70
    if-eqz v3, :cond_7a

    .line 1416
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    const-string v6, "@Parameter does not support ArrayLists, use @ParameterArrayList instead"

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1420
    :cond_7a
    const-class v8, Lorg/dmfs/android/retentionmagic/annotations/ParameterArrayList;

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lorg/dmfs/android/retentionmagic/annotations/ParameterArrayList;

    .line 1421
    .local v4, "paramList":Lorg/dmfs/android/retentionmagic/annotations/ParameterArrayList;
    if-eqz v4, :cond_d4

    const-class v8, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_d4

    .line 1423
    invoke-virtual {v0, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1424
    invoke-interface {v4}, Lorg/dmfs/android/retentionmagic/annotations/ParameterArrayList;->value()Ljava/lang/String;

    move-result-object v2

    .line 1425
    .restart local v2    # "key":Ljava/lang/String;
    if-eqz v2, :cond_9f

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_a3

    .line 1427
    :cond_9f
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1430
    :cond_a3
    invoke-interface {v4}, Lorg/dmfs/android/retentionmagic/annotations/ParameterArrayList;->genericType()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getArrayListHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v1

    .line 1431
    .restart local v1    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v1, :cond_b1

    .line 1433
    invoke-virtual {v1, v0, p1, v2, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_4a

    .line 1437
    :cond_b1
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "list with generic type of "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " not supported"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1440
    .end local v1    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v2    # "key":Ljava/lang/String;
    :cond_d4
    if-eqz v4, :cond_4a

    .line 1442
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    const-string v6, "@ParameterArrayList supports only ArrayList fields, use @Parameter instead"

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static persist(Landroid/app/Activity;Landroid/content/SharedPreferences$Editor;)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 1223
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences$Editor;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1229
    :goto_7
    return-void

    .line 1225
    :catch_8
    move-exception v0

    .line 1227
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static persist(Landroid/app/Activity;Landroid/content/SharedPreferences;)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 1165
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1167
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/app/Activity;Landroid/content/SharedPreferences$Editor;)V

    .line 1168
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_11

    .line 1171
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1178
    :goto_10
    return-void

    .line 1176
    :cond_11
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_10
.end method

.method public static persist(Landroid/app/Fragment;Landroid/content/SharedPreferences$Editor;)V
    .registers 4
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 1236
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences$Editor;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1242
    :goto_7
    return-void

    .line 1238
    :catch_8
    move-exception v0

    .line 1240
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static persist(Landroid/app/Fragment;Landroid/content/SharedPreferences;)V
    .registers 5
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 1184
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1186
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/app/Fragment;Landroid/content/SharedPreferences$Editor;)V

    .line 1187
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_11

    .line 1190
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1197
    :goto_10
    return-void

    .line 1195
    :cond_11
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_10
.end method

.method public static persist(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences$Editor;)V
    .registers 4
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 1249
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences$Editor;)V
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_8

    .line 1255
    :goto_7
    return-void

    .line 1251
    :catch_8
    move-exception v0

    .line 1253
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_7
.end method

.method public static persist(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences;)V
    .registers 5
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 1203
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1205
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences$Editor;)V

    .line 1206
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_11

    .line 1209
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1216
    :goto_10
    return-void

    .line 1214
    :cond_11
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_10
.end method

.method private static persist(Ljava/lang/Class;Ljava/lang/Object;Landroid/content/SharedPreferences$Editor;)V
    .registers 14
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "editor"    # Landroid/content/SharedPreferences$Editor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "Landroid/content/SharedPreferences$Editor;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 1322
    .local p0, "classInstance":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v6, Lorg/dmfs/android/retentionmagic/RetentionMagic;->CLASS_CACHE:Ljava/util/Map;

    invoke-interface {v6, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 1324
    .local v3, "helperCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    if-nez v3, :cond_97

    .line 1326
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    array-length v8, v7

    const/4 v6, 0x0

    :goto_10
    if-lt v6, v8, :cond_13

    .line 1380
    :cond_12
    return-void

    .line 1326
    :cond_13
    aget-object v1, v7, v6

    .line 1328
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v9, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    invoke-virtual {v1, v9}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    .line 1329
    .local v5, "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    if-eqz v5, :cond_8d

    const-class v9, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-nez v9, :cond_8d

    .line 1331
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->permanent()Z

    move-result v9

    if-nez v9, :cond_34

    .line 1326
    :cond_31
    :goto_31
    add-int/lit8 v6, v6, 0x1

    goto :goto_10

    .line 1336
    :cond_34
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1338
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->key()Ljava/lang/String;

    move-result-object v4

    .line 1339
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->instanceNSField()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->classNS()Ljava/lang/String;

    move-result-object v10

    invoke-static {p0, v9, v10, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getTag(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 1340
    if-eqz v4, :cond_50

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_54

    :cond_50
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1339
    .end local v4    # "key":Ljava/lang/String;
    :cond_54
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 1340
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1342
    .restart local v4    # "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v2

    .line 1343
    .local v2, "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v2, :cond_6a

    .line 1345
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->storeInPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_31

    .line 1349
    :cond_6a
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "field of class "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not supported for permanent storage"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1352
    .end local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v4    # "key":Ljava/lang/String;
    :cond_8d
    if-eqz v5, :cond_31

    .line 1354
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    const-string v7, "@Retain does not support ArrayLists, use @RetainArrayList instead"

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1360
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    :cond_97
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_9f
    :goto_9f
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_12

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1362
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    .line 1363
    .restart local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 1364
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    if-eqz v2, :cond_9f

    .line 1366
    const-class v7, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    .line 1367
    .restart local v5    # "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    if-eqz v5, :cond_9f

    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->permanent()Z

    move-result v7

    if-eqz v7, :cond_9f

    .line 1372
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->key()Ljava/lang/String;

    move-result-object v4

    .line 1373
    .restart local v4    # "key":Ljava/lang/String;
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->instanceNSField()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->classNS()Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v7, v8, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getTag(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1374
    if-eqz v4, :cond_e1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_e5

    :cond_e1
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1373
    .end local v4    # "key":Ljava/lang/String;
    :cond_e5
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1374
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1376
    .restart local v4    # "key":Ljava/lang/String;
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->storeInPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_9f
.end method

.method public static restore(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "instanceState"    # Landroid/os/Bundle;

    .prologue
    .line 908
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p0, p1, v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9

    .line 914
    :goto_8
    return-void

    .line 910
    :catch_9
    move-exception v0

    .line 912
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_8
.end method

.method public static restore(Landroid/app/Fragment;Landroid/os/Bundle;)V
    .registers 5
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "instanceState"    # Landroid/os/Bundle;

    .prologue
    .line 929
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p0, p1, v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9

    .line 935
    :goto_8
    return-void

    .line 931
    :catch_9
    move-exception v0

    .line 933
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_8
.end method

.method public static restore(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .registers 5
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "instanceState"    # Landroid/os/Bundle;

    .prologue
    .line 950
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p0, p1, v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9

    .line 956
    :goto_8
    return-void

    .line 952
    :catch_9
    move-exception v0

    .line 954
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_8
.end method

.method public static store(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "instanceState"    # Landroid/os/Bundle;

    .prologue
    .line 845
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, p0, p1, v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9

    .line 851
    :goto_8
    return-void

    .line 847
    :catch_9
    move-exception v0

    .line 849
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_8
.end method

.method public static store(Landroid/app/Fragment;Landroid/os/Bundle;)V
    .registers 5
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "instanceState"    # Landroid/os/Bundle;

    .prologue
    .line 866
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, p0, p1, v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9

    .line 872
    :goto_8
    return-void

    .line 868
    :catch_9
    move-exception v0

    .line 870
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_8
.end method

.method public static store(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .registers 5
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "instanceState"    # Landroid/os/Bundle;

    .prologue
    .line 887
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, p0, p1, v2}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9

    .line 893
    :goto_8
    return-void

    .line 889
    :catch_9
    move-exception v0

    .line 891
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_8
.end method

.method private static storeAndRestore(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;Z)V
    .registers 16
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "instanceState"    # Landroid/os/Bundle;
    .param p3, "store"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "Landroid/os/Bundle;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 962
    .local p0, "classInstance":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p2, :cond_3

    .line 1081
    :cond_2
    :goto_2
    return-void

    .line 968
    :cond_3
    sget-object v7, Lorg/dmfs/android/retentionmagic/RetentionMagic;->CLASS_CACHE:Ljava/util/Map;

    invoke-interface {v7, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 970
    .local v3, "helperCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    if-nez v3, :cond_100

    .line 972
    new-instance v3, Ljava/util/HashMap;

    .end local v3    # "helperCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 973
    .restart local v3    # "helperCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    array-length v9, v8

    const/4 v7, 0x0

    :goto_18
    if-lt v7, v9, :cond_20

    .line 1044
    sget-object v7, Lorg/dmfs/android/retentionmagic/RetentionMagic;->CLASS_CACHE:Ljava/util/Map;

    invoke-interface {v7, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 973
    :cond_20
    aget-object v1, v8, v7

    .line 975
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v10, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    invoke-virtual {v1, v10}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    .line 976
    .local v5, "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    if-eqz v5, :cond_88

    const-class v10, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_88

    .line 978
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 980
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->key()Ljava/lang/String;

    move-result-object v4

    .line 981
    .local v4, "key":Ljava/lang/String;
    if-eqz v4, :cond_48

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_4c

    .line 983
    :cond_48
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 986
    :cond_4c
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    invoke-static {v10}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v2

    .line 987
    .local v2, "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v2, :cond_65

    .line 989
    if-eqz p3, :cond_61

    .line 991
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->storeInBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 997
    :goto_5b
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 973
    .end local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v4    # "key":Ljava/lang/String;
    :cond_5e
    :goto_5e
    add-int/lit8 v7, v7, 0x1

    goto :goto_18

    .line 995
    .restart local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .restart local v4    # "key":Ljava/lang/String;
    :cond_61
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_5b

    .line 1001
    :cond_65
    new-instance v7, Ljava/lang/UnsupportedOperationException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "field of class "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not supported"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1004
    .end local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v4    # "key":Ljava/lang/String;
    :cond_88
    if-eqz v5, :cond_92

    .line 1006
    new-instance v7, Ljava/lang/UnsupportedOperationException;

    const-string v8, "@Retain does not support ArrayLists, use @RetainArrayList instead"

    invoke-direct {v7, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1010
    :cond_92
    const-class v10, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;

    invoke-virtual {v1, v10}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;

    .line 1011
    .local v6, "retainList":Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;
    if-eqz v6, :cond_f6

    const-class v10, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_f6

    .line 1013
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1014
    invoke-interface {v6}, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;->key()Ljava/lang/String;

    move-result-object v4

    .line 1015
    .restart local v4    # "key":Ljava/lang/String;
    if-eqz v4, :cond_b8

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_bc

    .line 1017
    :cond_b8
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1020
    :cond_bc
    invoke-interface {v6}, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;->genericType()Ljava/lang/Class;

    move-result-object v10

    invoke-static {v10}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->getArrayListHelper(Ljava/lang/Class;)Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    move-result-object v2

    .line 1021
    .restart local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    if-eqz v2, :cond_d3

    .line 1023
    if-eqz p3, :cond_cf

    .line 1025
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->storeInBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 1031
    :goto_cb
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5e

    .line 1029
    :cond_cf
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_cb

    .line 1035
    :cond_d3
    new-instance v7, Ljava/lang/UnsupportedOperationException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "list with generic type of "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not supported"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1038
    .end local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    .end local v4    # "key":Ljava/lang/String;
    :cond_f6
    if-eqz v6, :cond_5e

    .line 1040
    new-instance v7, Ljava/lang/UnsupportedOperationException;

    const-string v8, "@RetainArrayList supports only ArrayList fields, use @Retain instead"

    invoke-direct {v7, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1048
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    .end local v6    # "retainList":Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;
    :cond_100
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_108
    :goto_108
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1050
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/reflect/Field;Lorg/dmfs/android/retentionmagic/PersistenceHelper;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/android/retentionmagic/PersistenceHelper;

    .line 1051
    .restart local v2    # "helper":Lorg/dmfs/android/retentionmagic/PersistenceHelper;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 1052
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    if-eqz v2, :cond_108

    .line 1054
    const-class v7, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lorg/dmfs/android/retentionmagic/annotations/Retain;

    .line 1056
    .restart local v5    # "retain":Lorg/dmfs/android/retentionmagic/annotations/Retain;
    if-eqz v5, :cond_142

    .line 1058
    invoke-interface {v5}, Lorg/dmfs/android/retentionmagic/annotations/Retain;->key()Ljava/lang/String;

    move-result-object v4

    .line 1065
    .restart local v4    # "key":Ljava/lang/String;
    :goto_130
    if-eqz v4, :cond_138

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_13c

    .line 1067
    :cond_138
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1070
    :cond_13c
    if-eqz p3, :cond_14f

    .line 1072
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->storeInBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_108

    .line 1062
    .end local v4    # "key":Ljava/lang/String;
    :cond_142
    const-class v7, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    check-cast v7, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;

    invoke-interface {v7}, Lorg/dmfs/android/retentionmagic/annotations/RetainArrayList;->key()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "key":Ljava/lang/String;
    goto :goto_130

    .line 1076
    :cond_14f
    invoke-virtual {v2, v1, p1, v4, p2}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;->restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_108
.end method
