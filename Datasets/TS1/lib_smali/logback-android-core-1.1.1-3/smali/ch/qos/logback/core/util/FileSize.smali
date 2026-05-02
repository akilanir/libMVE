.class public Lch/qos/logback/core/util/FileSize;
.super Ljava/lang/Object;


# static fields
.field private static final DOUBLE_GROUP:I = 0x1

.field private static final FILE_SIZE_PATTERN:Ljava/util/regex/Pattern;

.field static final GB_COEFFICIENT:J = 0x40000000L

.field static final KB_COEFFICIENT:J = 0x400L

.field private static final LENGTH_PART:Ljava/lang/String; = "([0-9]+)"

.field static final MB_COEFFICIENT:J = 0x100000L

.field private static final UNIT_GROUP:I = 0x2

.field private static final UNIT_PART:Ljava/lang/String; = "(|kb|mb|gb)s?"


# instance fields
.field final size:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "([0-9]+)\\s*(|kb|mb|gb)s?"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lch/qos/logback/core/util/FileSize;->FILE_SIZE_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lch/qos/logback/core/util/FileSize;->size:J

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/util/FileSize;
    .registers 6

    sget-object v0, Lch/qos/logback/core/util/FileSize;->FILE_SIZE_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_6b

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    const-wide/16 v0, 0x1

    :goto_28
    new-instance v4, Lch/qos/logback/core/util/FileSize;

    mul-long/2addr v0, v2

    invoke-direct {v4, v0, v1}, Lch/qos/logback/core/util/FileSize;-><init>(J)V

    return-object v4

    :cond_2f
    const-string v1, "kb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3a

    const-wide/16 v0, 0x400

    goto :goto_28

    :cond_3a
    const-string v1, "mb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_46

    const-wide/32 v0, 0x100000

    goto :goto_28

    :cond_46
    const-string v1, "gb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_52

    const-wide/32 v0, 0x40000000

    goto :goto_28

    :cond_52
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "String value ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] is not in the expected format."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getSize()J
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/core/util/FileSize;->size:J

    return-wide v0
.end method
