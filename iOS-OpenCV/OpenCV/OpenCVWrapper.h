//
//  OpenCVWrapper.h
//  iOS-OpenCV
//
//  Created by ben on 2019/3/8.
//  Copyright © 2019 ben. All rights reserved.
//

#ifndef OpenCVWrapper_h
#define OpenCVWrapper_h

#import<UIKit/UIKit.h>
#import<Foundation/Foundation.h>

@interface OpenCVWrapper: NSObject

    + (UIImage *) color2Gray:(UIImage *)inputImage alphaExist:(bool)alphaExist;

@end
#endif /* OpenCVWrapper_h */
