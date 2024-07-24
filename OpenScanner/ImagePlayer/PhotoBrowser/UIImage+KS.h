#import <UIKit/UIKit.h>

@interface UIImage (KS)

#pragma mark - Create image

+ (nullable UIImage *)ks_imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

+ (nullable UIImage *)ks_imageWithColor:(UIColor *)color;

+ (nullable UIImage *)ks_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (nullable UIImage *)ks_imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock;

- (BOOL)ks_hasAlphaChannel;

- (void)ks_drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips;

- (nullable UIImage *)ks_imageByResizeToSize:(CGSize)size;

- (nullable UIImage *)ks_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

- (nullable UIImage *)ks_imageByCropToRect:(CGRect)rect;

- (nullable UIImage *)ks_imageByInsetEdge:(UIEdgeInsets)insets withColor:(nullable UIColor *)color;

- (nullable UIImage *)ks_imageByRoundCornerRadius:(CGFloat)radius;

- (nullable UIImage *)ks_imageByRoundCornerRadius:(CGFloat)radius
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor;

- (nullable UIImage *)ks_imageByRoundCornerRadius:(CGFloat)radius
                                          corners:(UIRectCorner)corners
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor
                                   borderLineJoin:(CGLineJoin)borderLineJoin;


- (nullable UIImage *)ks_imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;


- (nullable UIImage *)ks_imageByRotateLeft90;

- (nullable UIImage *)ks_imageByRotateRight90;

- (nullable UIImage *)ks_imageByRotate180;

- (nullable UIImage *)ks_imageByFlipVertical;

- (nullable UIImage *)ks_imageByFlipHorizontal;

- (nullable UIImage *)ks_imageByTintColor:(UIColor *)color;

- (nullable UIImage *)ks_imageByGrayscale;

- (nullable UIImage *)ks_imageByBlurSoft;

- (nullable UIImage *)ks_imageByBlurLight;

- (nullable UIImage *)ks_imageByBlurExtraLight;

- (nullable UIImage *)ks_imageByBlurDark;

- (nullable UIImage *)ks_imageByBlurWithTint:(UIColor *)tintColor;

- (nullable UIImage *)ks_imageByBlurRadius:(CGFloat)blurRadius
                                 tintColor:(nullable UIColor *)tintColor
                                  tintMode:(CGBlendMode)tintBlendMode
                                saturation:(CGFloat)saturation
                                 maskImage:(nullable UIImage *)maskImage;

@end
