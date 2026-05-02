.class public Lch/qos/logback/core/pattern/color/BoldYellowCompositeConverter;
.super Lch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase",
        "<TE;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected getForegroundColorCode(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "1;33"

    return-object v0
.end method
