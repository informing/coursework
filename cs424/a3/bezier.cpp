#include "bezier.h"
#include GLUT_INCLUDE_FILE

#include <cmath>
#include <cassert>
#include <iostream>
#include <stack>

Vector2D BezierCurve::evaluate(float t) const
{
    assert(t >= 0.0f && t <= 1.0f);
    assert(controlPoints.size() > 1);

    // Evaluate the Bezier curve at the given t parameter.
    // You may find the following functions useful:
    //  - BezierCurve::binomialCoefficient(m,i) computes "m choose i", 
    //      aka: (m over i)
    //  - std::pow(t,i) computes t raised to the power i

    //@@@@@
    // YOUR CODE HERE
    Vector2D result(.0, .0);
    float Bi = 0.;
    int m = controlPoints.size() - 1;
    //std::cout << "Start" << std::endl;
    for (unsigned i = 0; i < controlPoints.size(); i += 1) {
        Bi = binomialCoefficient(m, i) * std::pow(t, i) * std::pow(1-t, m-i);
        //std::cout << "t:" << t << " Bi:" << Bi << std::endl;
        result += Bi * controlPoints[i];
    }
    //std::cout << "End" << std::endl;
    //@@@@@
    
    
    
    return result;
    //return Vector2D(0.5, 0.5); // REPLACE THIS
}


void BezierCurve::subdivide(BezierCurve& curve1, BezierCurve& curve2) const
{
    // Subdivide this Bezier curve into two curves.
    // Return the two smaller curves in curve1 and curve2.

    //@@@@@
    // YOUR CODE HERE
    std::vector<Vector2D> oldPoints = controlPoints;
    std::stack<Vector2D> secondCurvePoints;
    while (!oldPoints.empty()) {
        std::vector<Vector2D> newPoints;
        secondCurvePoints.push(oldPoints.back());
        curve1.addControlPoint(oldPoints.front());
        //curve2.addControlPoint(oldPoints.back());
        for (unsigned i = 1; i < oldPoints.size(); i += 1) {
            newPoints.push_back((oldPoints[i-1] + oldPoints[i]) / 2);
        }
        oldPoints = newPoints;
    }
    while (!secondCurvePoints.empty()) {
        curve2.addControlPoint(secondCurvePoints.top());
        secondCurvePoints.pop();
    }
    //@@@@@

}


void BezierCurve::draw() const
{
    // Draw this Bezier curve.
    // Do this by evaluating the curve at some finite number of t-values,
    // and drawing line segments between those points.
    // You may use the BezierCurve::drawLine() function to do the actual
    // drawing of line segments.

    //@@@@@
    // YOUR CODE HERE
    const float STEP = 0.001;
    Vector2D prev = evaluate(0);
    for (float t = STEP; t <= 1.; t += STEP) {
        Vector2D curr = evaluate(t);
        drawLine(prev, curr);
        prev = curr;
    }
    //@@@@@
 
}


void BezierCurve::drawControlPolygon() const
{
    for (size_t i = 1; i < controlPoints.size(); ++i)
    {
        drawLine(controlPoints[i-1], controlPoints[i]);
    }
}


unsigned long BezierCurve::binomialCoefficient(int n, int k)
{
    // Compute nCk ("n choose k")
    // WARNING: Vulnerable to overflow when n is very large!

    assert(k >= 0);
    assert(n >= k);

    unsigned long result = 1;
    for (int i = 1; i <= k; ++i)
    {
        result *= n-(k-i);
        result /= i;
    }
    return result;
}


void BezierCurve::drawLine(const Vector2D& p1, const Vector2D& p2)
{
    glBegin(GL_LINES);
    glVertex2f(p1[0], p1[1]);
    glVertex2f(p2[0], p2[1]);
    glEnd();
}


void CurveManager::drawCurves() const
{
    if (points == NULL || points->size() < 2)
    {
        return;
    }

    if (curveMode == BASIC_MODE)
    {
        // Basic Mode
        //
        // Create a Bezier curve from the entire set of points,
        // and then simply draw it to the screen.
        
        BezierCurve curve(*points);
        curve.draw();

    }
    else if (curveMode == SUBDIVISION_MODE)
    {
        // Subdivision mode
        //
        // Create a Bezier curve from the entire set of points,
        // then subdivide it the number of times indicated by the 
        // subdivisionLevel variable.
        // The control polygons of the subdivided curves will converge 
        // to the actual bezier curve, so we only need to draw their 
        // control polygons.

        //@@@@@
        // YOUR CODE HERE
        BezierCurve curve(*points);
        std::vector<BezierCurve> prev;
        prev.push_back(curve);
        for (int iterations = 0; iterations < subdivisionLevel; iterations += 1)
        {
            std::vector<BezierCurve> curr;
            for (std::vector<BezierCurve>::const_iterator piece = prev.begin(); 
                    piece < prev.end(); piece += 1) {
                BezierCurve curve1, curve2;
                piece->subdivide(curve1, curve2);
                curr.push_back(curve1);
                curr.push_back(curve2);
            }
            prev.swap(curr);
        }
        
        curve.clearControlPoints();
        for (std::vector<BezierCurve>::const_iterator piece = prev.begin();
                piece < prev.end(); piece += 1) {
            std::vector<Vector2D> cps = piece->getControlPoints();
            for (std::vector<Vector2D>::const_iterator point = cps.begin();
                    point < cps.end(); point += 1) {
                curve.addControlPoint(*point);
            }
        }
        curve.drawControlPolygon();
        //@@@@@
    
    }
    else if (curveMode == PIECEWISE_MODE)
    {
        // Piecewise mode
        //
        // Create multiple Bezier curves out of the set of poitns, 
        // each of degree equal to the piecewiseDegree variable.
        // (The last curve may have degree less than piecewiseDegree.)

        if (continuityMode == C0_MODE)
        {
            // C0 continuity
            //
            // Each piecewise curve should be C0 continuous with adjacent
            // curves, meaning they should share an endpoint.

            //@@@@@
            // YOUR CODE HERE
            //std::cout << "piecewiseDegree:" << piecewiseDegree << std::endl;
            if (points->size() > piecewiseDegree) {
                for (std::vector<Vector2D>::const_iterator it = points->begin(); 
                        it < points->end() - piecewiseDegree; 
                        it += piecewiseDegree) {
                    std::vector<Vector2D> range(it, it+piecewiseDegree+1);
                    //std::cout << "it:" << (it + 1)->norm2() << std::endl;
                    BezierCurve curve(range);
                    curve.draw();
                }
            } 

            //@@@@@

        }
        else if (continuityMode == C1_MODE)
        {
            // C1 continuity
            //
            // Each piecewise curve should be C1 continuous with adjacent 
            // curves.  This means that not only must they share an endpoint,
            // they must also have the same tangent at that endpoint.
            // You will likely need to add additional control points to your 
            // Bezier curves in order to enforce the C1 property.
            // These additional control points do not need to show up onscreen.

            //@@@@@
            // YOUR CODE HERE
            std::vector<Vector2D> inserted;
            if (points->size() > 2 * piecewiseDegree) {
                for (std::vector<Vector2D>::const_iterator it = points->begin(); 
                        it < points->end() - piecewiseDegree; 
                        it += piecewiseDegree + 1) {
                    // construct a curve formed by user provided pts
                    std::vector<Vector2D> curve1(it, it+piecewiseDegree+1);

                    if (it < points->end() - piecewiseDegree * 2) {
                        BezierCurve connector;
                        
                        // get p_{n-1}
                        Vector2D pn1 = *(it+piecewiseDegree-1);
                        // p_{n} is the same as q_{0}
                        Vector2D pn = *(it+piecewiseDegree);
                        // p and q have the same tangent at q_{0}
                        // so p_{n} - p_{n-1} = q_{1} - q_{0}
                        Vector2D q1 = 2 * pn - pn1;
                        
                        // r_{0} is the same as q_{n}
                        Vector2D r0 = *(it+piecewiseDegree+1);
                        // r_{1}
                        Vector2D r1 = *(it+piecewiseDegree+2);
                        // q and r have the same tangent at q_{n}
                        // so q_{n} - q_{n-1} = r_{1} - r_{0}
                        Vector2D qn1 = 2 * r0 - r1;
                        
                        // we use q_{0}, q_{1}, q_{n-1}, q_{n} as the ctrl pts
                        connector.addControlPoint(pn);
                        connector.addControlPoint(q1);
                        connector.addControlPoint(qn1);
                        connector.addControlPoint(r0);

                        // plot the connector
                        connector.draw();
                    }
                    
                    // plot the first curve
                    BezierCurve first(curve1);
                    first.draw();
                }
            }
            //@@@@@

        }
    }
}


