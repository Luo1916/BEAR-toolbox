classdef TVPsettings < bear.settings.BASEsettings
    %TVPSETTINGS Panel VAR settings class
    %   The bear.settings.TVPsettings class is a class that creates a settings
    %   object to run a time-varying VAR. It can be created directly by
    %   running:
    %
    %   bear.settings.TVPsettings(ExcelPath, varargin)
    %
    %   or in its more convenient form:
    %
    %   BEARsettings('TVP', ExcelPath = 'path/To/file.xlsx')
    %
    % TVPsettings Properties:
    %    tvbvar          - choice of time-varying BVAR model 
    %    It              - Gibbs sampler iterations
    %    Bu              - Gibbs sampler burn-in iterations
    %    pick            - retain only one post burn iteration
    %    pickf           - frequency of iteration picking
    %    alltirf         - calculate IRFs for every sample period
    %    gamma           - hyperparameter
    %    alpha0          - hyperparameter
    %    delta0          - hyperparameter
    %    ar              - auto-regressive coefficients
    %    PriorExcel      - Select individual priors
    %    priorsexogenous - Gibbs sampler burn-in iterations
    %    lambda4         - hyperparameter    
    
    properties
        % choice of time-varying BVAR model 
        % 1 = time-varying coefficients (TVP)
        % 2 = general time-varying (TVP_SV)
        tvbvar (1,1) bear.TVPtype = 2;
        % total number of iterations for the Gibbs sampler
        It=200;
        % number of burn-in iterations for the Gibbs sampler
        Bu=100;
        % choice of retaining only one post burn iteration over 'pickf' iterations (1=yes, 0=no)
        pick (1,1) logical = false;
        % frequency of iteration picking (e.g. pickf=20 implies that only 1 out of 20 iterations will be retained)
        pickf=20;
        % calculate IRFs for every sample period (1=yes, 0=no)
        alltirf (1,1) logical = true;        
        % just for the code to run (do not touch)
        ar=0;
        % switch to Excel interface
        PriorExcel (1,1) logical = false; % set to 1 if you want individual priors, 0 for default
        % switch to Excel interface for exogenous variables 
        priorsexogenous (1,1) logical = true; % set to 1 if you want individual priors, 0 for default
        % hyperparameter: lambda4
        lambda4=100;
    end
    
    properties %Hyperparameters
        % hyperparameter: gamma
        gamma (1,1) double = 0.85;
        % hyperparameter: alpha0
        alpha0 (1,1) double = 0.001;
        % hyperparameter: delta0
        delta0 (1,1) double = 0.001;
    end
    
    methods
        
        function obj = TVPsettings(excelPath, varargin)
            
            obj@bear.settings.BASEsettings(6, excelPath)
            
            obj = parseBEARSettings(obj, varargin{:});
            
        end
        
    end
    
end