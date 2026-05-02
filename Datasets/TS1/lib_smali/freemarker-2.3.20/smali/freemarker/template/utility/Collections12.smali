.class public Lfreemarker/template/utility/Collections12;
.super Ljava/lang/Object;
.source "Collections12.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/utility/Collections12$1;,
        Lfreemarker/template/utility/Collections12$SingletonList;,
        Lfreemarker/template/utility/Collections12$SingletonMap;,
        Lfreemarker/template/utility/Collections12$EmptyMap;
    }
.end annotation


# static fields
.field public static final EMPTY_MAP:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 70
    new-instance v0, Lfreemarker/template/utility/Collections12$EmptyMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lfreemarker/template/utility/Collections12$EmptyMap;-><init>(Lfreemarker/template/utility/Collections12$1;)V

    sput-object v0, Lfreemarker/template/utility/Collections12;->EMPTY_MAP:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method

.method static access$100(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 68
    invoke-static {p0, p1}, Lfreemarker/template/utility/Collections12;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static eq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "o1"    # Ljava/lang/Object;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 283
    if-nez p0, :cond_8

    if-nez p1, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public static singletonList(Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 248
    new-instance v0, Lfreemarker/template/utility/Collections12$SingletonList;

    invoke-direct {v0, p0}, Lfreemarker/template/utility/Collections12$SingletonList;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;
    .registers 3
    .param p0, "key"    # Ljava/lang/Object;
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 133
    new-instance v0, Lfreemarker/template/utility/Collections12$SingletonMap;

    invoke-direct {v0, p0, p1}, Lfreemarker/template/utility/Collections12$SingletonMap;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method
